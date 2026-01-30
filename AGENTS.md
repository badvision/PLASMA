# PLASMA Development Guide for AI Agents

This guide captures hard-won debugging lessons from developing PLASMA programs for the Apple II. Future Claude sessions: **Read "Critical Lessons Learned" first**, then reference other sections as needed.

---

## Table of Contents

1. [Critical Lessons Learned (START HERE!)](#-critical-lessons-learned-start-here)
2. [Memory Layout and Load Addresses](#memory-layout-and-load-addresses)
3. [Stack Safety and Buffer Allocation](#stack-safety-and-buffer-allocation)
4. [Build System and Freshness Verification](#build-system-and-freshness-verification)
5. [Module System (Most Common Bug)](#module-system-most-common-bug)
6. [Console Functions and Return Values](#console-functions-and-return-values)
7. [FPU Operations](#fpu-operations)
8. [Graphics Programming](#graphics-programming)
9. [Debugging Strategies](#debugging-strategies)
10. [Automated Testing with JACE Terminal](#automated-testing-with-jace-terminal)
11. [Quick Reference Tables](#quick-reference-tables)

---

## 🔥 Critical Lessons Learned (START HERE!)

**Read this before doing ANYTHING else.** These lessons cost hours of debugging.

**Quick Navigation:**
1. Memory Layout (Programs >4KB)
2. Stack Corruption (Return Values)
3. Build Freshness (Timestamps)
4. Stack vs Global Buffers
5. FPU Operations (@ Operator)
6. SANE State Management
7. Function Side Effects (Error Paths)
8. Array Access and memcpy
9. ACME Errors (Check PLASMA Source)

### 1. Memory Layout: Programs >4KB Need $6000+

```
| Address Range | Purpose | Max Program Size |
|--------------|---------|------------------|
| $0800-$1FFF | Safe for small programs | 6KB |
| $2000-$5FFF | HGR graphics (DO NOT USE) | - |
| $6000-$95FF | Safe for large programs | 13.5KB |
```

**Load address $1000 (4094) only safe for programs <4KB!**

- HGR graphics memory: $2000-$5FFF (12KB reserved by ProDOS)
- **Programs >4KB MUST load at $6000** (24574)
- Symptom: Crashes, corruption, garbage graphics
- Check: `ls -lh rel/YOURPROGRAM#FE*` - if >4KB, use `--setpc 24574`

```bash
# Wrong (large program)
acme --setpc 4094 -o rel/MANDEL#FE1000 samplesrc/mandel.a  # ❌ Will corrupt HGR memory!

# Correct (large program)
acme --setpc 24574 -o rel/MANDEL#FE6000 samplesrc/mandel.a  # ✅ Loads at $6000
```

### 2. Stack Corruption and Return Statements

**THE MOST SUBTLE BUG**: Calling a function that returns a value without capturing it.

**CRITICAL: #0 Functions Do NOT Need Explicit `return` Statements!**

The compiler automatically handles returns for `#0` (void) functions. Adding explicit `return` statements can cause crashes!

```plasma
// ❌ WRONG - Corrupts stack!
conio:getkey()  // Returns byte, leaves on stack → crash

// ✅ CORRECT - Capture return value
key = conio:getkey()

// ✅ ALSO CORRECT - Use getc() which auto-drops
getc()  // Compiler generates DROP instruction
```

**What Happens:**
1. Function returns value on evaluation stack
2. You don't capture it
3. Function epilogue (LEAVE/RET) pops wrong addresses
4. RTS jumps to garbage memory (like $06FB text page!)

**Check function signatures in .plh files:**
```plasma
def functionName(param1, param2)#0    // Returns 0 values - NO explicit return needed!
def functionName(param1, param2)#1    // Returns 1 value (MUST CAPTURE!)
def functionName(param1, param2)#3    // Returns 3 values (MUST CAPTURE!)
```

**Correct patterns for #0 functions:**
```plasma
// ✅ CORRECT - No explicit return
def initSettings#0
  fpu:pushStr("-2.5")
  fpu:pullExt(@settings.real_min)
  // ... more init code ...
end  // Compiler adds return automatically

// ❌ WRONG - Explicit return causes crash!
def initSettings#0
  fpu:pushStr("-2.5")
  fpu:pullExt(@settings.real_min)
  return  // ❌ DON'T DO THIS!
end
```

**For #1 or higher functions:**
```plasma
// ✅ CORRECT - Must have explicit return with value
def mandelbrotIterate(x, y)#1
  if escaped
    return iter
  else
    return 0
  fin
  return 0  // Fallback needed after if/fin
end
```

**Red Flags:**
```plasma
conio:getkey()          // ❌ Returns 1 value
Mouse:readMouse()       // ❌ Returns 3 values!
fpu:cmpXY()            // ❌ Returns 1 value
```

**Detect in assembly:** Each ENTER must have exactly ONE matching LEAVE:
```bash
grep "ENTER\|LEAVE" samplesrc/yourprogram.a | grep -A1 "yourfunction"
```

### 3. Build Freshness: Verify Timestamps ALWAYS

**Build chain:** Source (.pla) → Assembly (.a) → Binary (REL) → Disk (.po)

**All timestamps MUST be in ascending order!**

```bash
# Mandatory check after EVERY build
ls -lh src/samplesrc/mandel.pla \
       src/samplesrc/mandel.a \
       src/rel/MANDEL\#FE6000 \
       PLEIADES-MEGAFLASH-FPU.po | \
  awk '{print $6, $7, $8, $9}'
```

**Expected output:**
```
Jan 25 13:09 samplesrc/mandel.pla    (source)
Jan 25 13:11 samplesrc/mandel.a      (assembly - AFTER source)
Jan 25 13:11 rel/MANDEL#FE6000       (binary - AFTER assembly)
Jan 25 13:13 PLEIADES-MEGAFLASH-FPU.po (disk - AFTER binary)
```

**If any timestamp out of order → REBUILD EVERYTHING!**

**Our build_disk.sh now fails fast:**
```bash
./build_disk.sh  # Exits on first compilation error
echo $?          # Check exit code (0 = success)
```

### 4. Stack vs Global Buffers

**Stack allocation >20 bytes = DANGER on Apple II!**

```plasma
// ❌ WRONG - Stack overflow!
def function#0
  byte[64] buffer  // Too large for stack!
  // ...
end

// ✅ CORRECT - Use global buffer
byte[64] buffer    // Global allocation

def function#0
  // Pass pointer to global buffer
  ext2str(@fp_value, @buffer, 3, 6, FPSTR_FIXED)
  puts(@buffer)
end
```

**Guidelines:**
- Small arrays (≤20 bytes) → OK on stack
- Large buffers (>20 bytes) → Use globals
- FP string conversion → Always use global `byte[20] buffer`

### 5. FPU Operations Need Pointers

**CRITICAL:** FPU push/pull operations require @ operator for addresses!

```plasma
// ❌ WRONG - Produces Inf/NaN
fpu:pushInt(maxIter)
fpu:pullExt(fp_var)

// ✅ CORRECT - Use @ for addresses
fpu:pushInt(@maxIter)
fpu:pullExt(@fp_var)
```

**All FPU operations that work with variables need @:**
- `fpu:pushExt(@var)`
- `fpu:pullExt(@var)`
- `fpu:pushInt(@var)`
- `str2ext(@string, @fp_var)`
- `ext2str(@fp_var, @buffer, ...)`

### 6. SANE State Management (Critical for FPU Work)

**SANE zero-page state must be carefully managed:**

```plasma
// ✅ CORRECT - Balanced saveZP/restoreZP
def myFPUFunction#1
  sane:saveZP()
  err = sane:op1FP(FFEXT|FOSQRT, @fp_var)
  return sane:restoreZP(err)
end

// ❌ WRONG - Unbalanced (corrupts SANE state)
def myFPUFunction#1
  sane:saveZP()
  if someCondition
    return err  // ❌ Forgot restoreZP!
  fin
  return sane:restoreZP(0)
end
```

**SANE Edge Cases:**
- **Zero values**: Calling `ext2str()` on all-zeros Extended (representing zero) can corrupt SANE's internal state!
- **Workaround**: Detect zero (exp byte = 0) and handle specially:

```plasma
def pullStr(pStr)#0
  // Check if zero BEFORE calling SANE
  if stackReg->0 == 0  // Exponent byte = 0 means zero
    pStr->0 = '0'
    pStr->1 = '.'
    pStr->2 = '0'
    pStr->3 = 0
    return
  fin

  // Non-zero: safe to use SANE
  MBFToExtended(stackReg, @tempExt)
  sane:saveZP()
  sane:restoreZP(ext2str(@tempExt, pStr, ...))
end
```

**reset() Pattern:**
Always call `sane:saveZP()` after `sane:initFP()`:

```plasma
def reset#0
  if sane:initFP() < 0
    return -1
  fin
  sane:saveZP()  // ✅ REQUIRED after initFP!

  // ... initialization code ...

  return 0  // Don't restoreZP here - nothing to restore to
end
```

### 7. Function Side Effects and Error Paths

**CRITICAL:** If a function modifies state (stack, pointers, registers) BEFORE validation, it MUST clean up on error!

```plasma
// ❌ WRONG - Corrupts stack on error
def pushStr(pStr)#0
  // Rotate stack FIRST
  temp = stackRegs[3]
  stackRegs[3] = stackRegs[2]
  stackRegs[2] = stackRegs[1]
  stackRegs[1] = stackRegs[0]
  stackRegs[0] = temp

  // Then parse (might fail!)
  err = str2ext(pStr, @tempExt)
  if err
    return err  // ❌ Stack left rotated!
  fin
end

// ✅ CORRECT - Validate BEFORE side effects
def pushStr(pStr)#0
  // Parse and convert FIRST
  err = str2ext(pStr, @tempExt)
  if err
    return err  // ✅ No side effects yet, safe to fail
  fin

  err = extendedToMBF(@tempExt, @buffer)
  if err
    return err  // ✅ Still no side effects
  fin

  // NOW rotate stack (after all validations pass)
  temp = stackRegs[3]
  stackRegs[3] = stackRegs[2]
  stackRegs[2] = stackRegs[1]
  stackRegs[1] = stackRegs[0]
  stackRegs[0] = temp

  // Copy result
  memcpy(stackRegs[0], @buffer, SIZE)
  return 0
end
```

**Pattern:** Validate inputs → Compute results → Modify state (in that order!)

### 8. Array Access and memcpy Gotchas

**Array element syntax:**

```plasma
byte[7] buffer

// ✅ CORRECT - Use colon for array indexing
buffer:0 = value
buffer:1 = value
ptr->0 = buffer:0

// ❌ WRONG - Don't use dot notation
buffer.0 = value  // Syntax error
```

**memcpy alternatives:**
Sometimes manual copy is more reliable than memcpy():

```plasma
// If memcpy causes issues, use manual copy:
dest->0 = src:0
dest->1 = src:1
dest->2 = src:2
dest->3 = src:3
dest->4 = src:4
dest->5 = src:5
dest->6 = src:6
```

### 9. ACME Compilation Errors Mean Check PLASMA Source

**When ACME assembler gives errors, investigate the PLASMA source:**

```bash
# ❌ ACME error: "Target out of range"
acme --setpc 4094 -o rel/PROGRAM#FE1000 samplesrc/program.a
# Error in line 1234: Target out of range

# ✅ Look at PLASMA source, not just assembly
# The PLASMA compiler generates the assembly from your source
# Error likely means:
# - Branch too far (code too complex, refactor function)
# - Relative jump exceeded limits (simplify logic)
```

**Common causes:**
- Function too large (split into smaller functions)
- Deeply nested if/elsif/fin chains (flatten logic)
- Large loop bodies (extract to helper functions)

---

## Memory Layout and Load Addresses

### ProDOS Memory Map

```
$0000-$07FF   Zero page, stack, ProDOS
$0800-$1FFF   Safe for programs ≤6KB
$2000-$3FFF   HGR page 1 (8KB)
$4000-$5FFF   HGR page 2 (8KB)
$6000-$95FF   Safe for large programs (13.5KB)
$9600-$BFFF   ProDOS, BASIC.SYSTEM
$C000-$CFFF   I/O space
$D000-$FFFF   ProDOS, language card
```

### Assembly Commands

```bash
# Small program (<4KB)
acme --setpc 4094 -o rel/PROGRAM#FE1000 samplesrc/program.a

# Large program (>4KB) - most real programs!
acme --setpc 24574 -o rel/PROGRAM#FE6000 samplesrc/program.a
```

### File Type Codes

- `#FE1000` = REL file at $1000
- `#FE6000` = REL file at $6000
- `#FF2000` = SYS file at $2000

---

## Stack Safety and Buffer Allocation

### Stack Size on Apple II

The Apple II has a **very limited stack** (typically 256 bytes in page 1). Large local allocations cause overflow.

### Safe Buffer Patterns

```plasma
// Pattern 1: Small local arrays (≤20 bytes) - SAFE
def processData#0
  byte[16] buffer
  // ...
end

// Pattern 2: Large buffers - Use globals
byte[64] formatBuffer
byte[20] fpStrBuffer

def formatValue#0
  ext2str(@fp_value, @fpStrBuffer, 3, 6, FPSTR_FIXED)
  puts(@fpStrBuffer)
end

// Pattern 3: Pass buffer pointers
def fillBuffer(bufPtr)#0
  byte i
  for i = 0 to 63
    ^(bufPtr + i) = i
  next
end

// Usage
fillBuffer(@formatBuffer)
```

### Red Flags

```plasma
// 🚩 DANGER - Too large for stack
def render#0
  byte[140] scanline  // ❌ 140 bytes on stack!
  ext[10] fpValues    // ❌ 100 bytes on stack!
end
```

---

## Build System and Freshness Verification

### Build Pipeline

```bash
# Step 1: Compile PLASMA → Assembly
cd src
./xplasm -AMOW samplesrc/program.pla
# Generates: samplesrc/program.a

# Step 2: Assemble → Binary
acme --setpc 24574 -o rel/PROGRAM#FE6000 samplesrc/program.a
# Generates: rel/PROGRAM#FE6000

# Step 3: Build disk image
cd ..
./build_disk.sh
# Updates: PLEIADES-MEGAFLASH-FPU.po
```

### Mandatory Verification

```bash
# Check EVERY timestamp after build
ls -lh src/samplesrc/program.pla \
       src/samplesrc/program.a \
       src/rel/PROGRAM\#FE6000 \
       PLEIADES-MEGAFLASH-FPU.po
```

**Timestamps must be chronological!** If not → you're testing stale code.

### Using Makefile

```bash
cd src
make rel/PROGRAM\#FE6000  # Builds program

# Always rebuild disk after make
cd ..
./build_disk.sh

# VERIFY timestamps!
ls -lh src/rel/PROGRAM* *.po
```

### Disk Image Creation

```bash
#!/bin/bash
# build_disk.sh pattern

# Start with blank ProDOS disk
cp images/apple/PLDSK32.PO MYDISK.po

# FIRST: Copy ProDOS (makes it bootable)
java -jar /tmp/ac.jar -p MYDISK.po PRODOS SYS < src/rel/apple/PRODOS

# Copy system files to root
java -jar /tmp/ac.jar -p MYDISK.po PLASMA.SYSTEM SYS < src/rel/apple/PLASMA.SYSTEM#FF2000

# Create SYS/ directory and copy modules
# IMPORTANT: Use "SYS/FILE" NOT "/SYS/FILE"
java -jar /tmp/ac.jar -p MYDISK.po SYS/CONIO REL < src/rel/CONIO#FE1000
java -jar /tmp/ac.jar -p MYDISK.po SYS/FPU REL < src/rel/FPU#FE1000

# Copy SANE FP libraries (for FPU programs)
java -jar /tmp/ac.jar -p MYDISK.po SYS/FP6502.CODE REL < src/rel/apple/FP6502.CODE#FE1000
java -jar /tmp/ac.jar -p MYDISK.po SYS/ELEMS.CODE REL < src/rel/apple/ELEMS.CODE#FE1000

# Copy your program
java -jar /tmp/ac.jar -p MYDISK.po PROGRAM REL < src/rel/PROGRAM#FE6000
```

**Common Pitfall:** Using `/SYS/FILE` creates a "/" directory. Always use `SYS/FILE`.

---

## Module System (Most Common Bug)

**CRITICAL:** Always use colon (`:`) for module calls, NEVER pointer dereference (`=>`).

```plasma
// ✅ CORRECT - Module pattern
import mouse
Mouse:setMouse(MOUSE_ENABLE)
xPos, yPos, status = Mouse:readMouse()#3

// ❌ WRONG - Pointer dereference (will crash!)
mouseAPI=>setMouse(MOUSE_ENABLE)
```

**Why This Matters:** Most program crashes are from incorrect module syntax.

### Module Import/Export

```plasma
// In module file (mymodule.pla)
export def myFunction(param)#1
  // ...
  return result
end

// In main program
import mymodule
value = mymodule:myFunction(123)
```

---

## Console Functions and Return Values

### conio Module Functions

```plasma
import conio

// ✅ CORRECT - Capture return values
key = conio:getkey()          // Returns byte
x, y = conio:getpos()#2       // Returns 2 values
conio:gotoxy(10, 5)           // No return (safe)
conio:clear(cleol)            // No return (safe)
conio:textctrl(ctrlattr, INVERSE)  // No return (safe)

// ❌ WRONG - Uncaptured return values
conio:getkey()      // ❌ Stack corruption!
conio:getpos()      // ❌ Stack corruption!
```

### cmdsys Functions (No Module Prefix)

These are predefined and don't need module prefix:

```plasma
puts("Hello\n")     // String output
puti(42)            // Integer output
puth($ABCD)         // Hex output
putln               // Newline
getc()              // Get char (auto-drops return)
```

**Key Difference:**
- `getc()` - cmdsys function, compiler auto-generates DROP
- `conio:getkey()` - module function, MUST capture return value

---

## FPU Operations

### Initialization

```plasma
import fpu

fpu:reset()  // ALWAYS call first!
```

### String to FP Conversion

```plasma
byte[20] fpStrBuffer  // Global buffer for FP strings

// String → FP
fpu:pushStr("-2.5")
fpu:pullExt(@my_fp_var)

// FP → String
ext2str(@my_fp_var, @fpStrBuffer, 3, 6, FPSTR_FIXED)
puts(@fpStrBuffer)
```

### Basic Arithmetic

```plasma
ext a, b, result

// Addition: result = a + b
fpu:pushExt(@a)
fpu:pushExt(@b)
fpu:addXY()
fpu:pullExt(@result)

// Subtraction: result = a - b
fpu:pushExt(@a)
fpu:pushExt(@b)
fpu:subXY()
fpu:pullExt(@result)

// Multiplication: result = a * b
fpu:pushExt(@a)
fpu:pushExt(@b)
fpu:mulXY()
fpu:pullExt(@result)
```

### Integer to FP Conversion

```plasma
word maxIter

// CRITICAL: Use @ operator!
fpu:pushInt(@maxIter)  // ✅ Correct
fpu:pullExt(@fp_var)

// ❌ WRONG - Produces Inf/NaN
fpu:pushInt(maxIter)
```

### Common FPU Constants

Define these as globals for reuse:

```plasma
ext fp_zero, fp_one, fp_two, fp_four
ext fp_point_five, fp_neg_two

def initConstants#0
  fpu:pushStr("0.0")
  fpu:pullExt(@fp_zero)

  fpu:pushStr("1.0")
  fpu:pullExt(@fp_one)

  fpu:pushStr("2.0")
  fpu:pullExt(@fp_two)

  fpu:pushStr("4.0")
  fpu:pullExt(@fp_four)
end
```

**Reference:** See `samplesrc/rpncalc.pla` for excellent FPU usage patterns.

### FPU Stack Semantics for Comparisons

**Understanding stack order for binary operations is CRITICAL:**

When you push two values, the first becomes Y and second becomes X:

```plasma
fpumf:pushMBF(@magnitude_sq)  // This is Y
fpumf:pushMBF(@escape_radius)  // This is X
cmpResult = fpumf:cmp()        // Computes Y - X
```

**Comparison returns:**
- `FPUCMPGT` (0x4040) if Y > X (positive result)
- `FPUCMPLT` (0x8080) if Y < X (negative result)
- `FPUCMPEQ` (0x0002) if Y == X (zero result)

**Common mistake - inverted logic:**

```plasma
// Testing if magnitude_sq > 4.0
fpumf:pushMBF(@magnitude_sq)  // Y
fpumf:pushStr("4.0")          // X
cmpResult = fpumf:cmp()       // Y - X

// ❌ WRONG - Inverted logic!
if cmpResult == FPUCMPLT  // Checks if Y < X (magnitude < 4.0)
  escaped = TRUE          // This is backwards!
fin

// ✅ CORRECT
if cmpResult == FPUCMPGT  // Checks if Y > X (magnitude > 4.0)
  escaped = TRUE          // This is correct!
fin
```

**How to think about it:**
- cmp() subtracts: `result = Y - X`
- If Y > X: result is positive → FPUCMPGT
- If Y < X: result is negative → FPUCMPLT
- If Y = X: result is zero → FPUCMPEQ

---

## Graphics Programming

### Memory Reservation

Graphics programs **MUST** reserve memory pages:

```plasma
// For DHGR (Double Hi-Res Graphics)
sysflags resxtxt1|reshgr1|resxhgr1

// NOT just text pages!
// sysflags restxt1|restxt2  // ❌ WRONG - crashes at dhgrMode()
```

### DHGR Coordinate Systems

DHGR has **two coordinate systems** - use the right one!

```plasma
// 560x192 DHGR "pixels" (documentation only)
// 140x192 COLOR pixels (what dcgrPixel uses!)

const SCREEN_WIDTH = 140   // Color pixels
const SCREEN_HEIGHT = 192

// Initialize line drawing
import dhgrlib
setlinespans(@dcgrHLin, @dcgrVLin)  // MUST call before drawing!

// Plot pixel
dcgrColor(CLR_WHITE)
dcgrPixel(x, y)  // x: 0-139, y: 0-191
```

### Graphics Mode Switching

```plasma
import dhgrlib

// Switch to graphics
dhgrMode(DHGR_COLOR_MODE)

// Draw graphics...

// Switch back to text (for debugging!)
dhgrMode(DHGR_TEXT_MODE)
puts("Debug: x=")
puti(x)
putln

// Back to graphics
dhgrMode(DHGR_COLOR_MODE)
```

---

## Debugging Strategies

### Strategy 1: Console Output (Most Reliable)

```plasma
// Use numbered DEBUG messages
puts("DEBUG 10: About to call function\n")
functionX()
puts("DEBUG 11: function returned\n")

// Print variables
puts("x=")
puti(x)
putln

// Print FP values
ext2str(@fp_var, @debugBuf, 3, 6, FPSTR_FIXED)
puts(@debugBuf)
putln
```

**Tip:** Debug in graphics mode - switch to text first:
```plasma
if x == 0 and y == 0  // Debug first pixel only
  dhgrMode(DHGR_TEXT_MODE)
  puts("First pixel calculation\n")
  // Print debug info
  conio:getkey()  // Pause
  dhgrMode(DHGR_COLOR_MODE)
fin
```

### Strategy 2: Assembly Analysis

```bash
# Look at generated assembly
cat src/samplesrc/program.a | less

# Check for unbalanced ENTER/LEAVE (stack corruption)
grep "ENTER\|LEAVE" samplesrc/program.a

# Find function calls
grep "CALL" samplesrc/program.a
```

### Strategy 3: Simplification

**Most Powerful:** Strip to bare minimum, add back incrementally:

```plasma
// Step 1: Prove program runs
def main#0
  puts("Program started\n")
end

// Step 2: Add initialization
def main#0
  puts("Init...\n")
  initSystem()
  puts("Init OK\n")
end

// Step 3: Add ONE feature
def main#0
  initSystem()
  testFeatureX()  // Just one feature
end

// Step 4: Add next feature
// ...
```

### Strategy 4: Host Testing (Fastest!)

For pure PLASMA code (no graphics/hardware):

```bash
cd src
./plvm yourprogram  # 100x faster than emulator!
```

**Limitation:** Graphics, I/O need emulator.

### Strategy 5: Automated Testing (Game Changer!)

**For rapid iteration, automate your tests with JACE terminal mode:**

```bash
#!/bin/bash
# test_myprogram.sh
cd /path/to/jace
mvn -q exec:java -Dexec.mainClass="jace.JaceLauncher" -Dexec.args="--terminal" <<'EOF'
nohints
bootdisk d1 /path/to/disk.po 7
type "+myprogram\n"
expect "Test Result" 10
showtext
qqq
EOF
```

**Benefits:**
- Rebuild and test in seconds instead of minutes
- Consistent, reproducible test conditions
- Catch regressions immediately
- Essential for debugging subtle bugs (like the CMP function fix)

**When to use:** Anytime you're making iterative fixes and need fast feedback.

See [Automated Testing with JACE Terminal](#automated-testing-with-jace-terminal) for complete details.

---

## Automated Testing with JACE Terminal

**The game changer:** JACE terminal mode enables fully autonomous testing of PLASMA programs without manual intervention.

### Why Automation Matters

Manual testing is slow and error-prone:
- Boot disk → type commands → wait for output → read screen
- Every code change requires the same tedious steps
- Hard to reproduce exact test conditions
- Can't regression test efficiently

**Solution:** JACE's `--terminal` mode with scripting commands.

### JACE Terminal Mode

Launch JACE in terminal mode for scriptable automation:

```bash
cd /path/to/jace
mvn -q exec:java -Dexec.mainClass="jace.JaceLauncher" -Dexec.args="--terminal"
```

This opens an interactive terminal that accepts commands. To script it, use heredoc:

```bash
mvn -q exec:java -Dexec.mainClass="jace.JaceLauncher" -Dexec.args="--terminal" <<'EOF'
# Commands go here
qqq
EOF
```

### Available Commands

#### `nohints` - Disable Splash Screen

```bash
nohints
```

**Purpose:** Suppress the JACE hints/splash screen so automation can proceed immediately.

**Usage:** Always use as the FIRST command in automated scripts.

#### `bootdisk` - Boot ProDOS Disk

```bash
bootdisk d1 /path/to/disk.po 7
```

**Parameters:**
- `d1` - Drive 1 (can also use d2)
- `/path/to/disk.po` - Full path to disk image
- `7` - Slot number (7 for 32MB SmartPort disks, 6 for 140KB floppies)

**What it does:**
1. Inserts disk in specified drive/slot
2. Resets the Apple II
3. Runs emulator until PC (program counter) >= $2000
4. This means ProDOS has booted and PLASMA is ready

**Critical:** Use slot 7 for 32MB ProDOS images! Slot 6 is only for 140KB floppy disks.

#### `type` - Type String with Keyboard Synchronization

```bash
type "+fptest.mf\n"
```

**Parameters:**
- String to type (use quotes if contains spaces)
- Use `\n` for Return/Enter key

**What it does:**
1. For each character:
   - Waits for 3 keyboard reads at $C000 (ensures ROM polling loops are ready)
   - Presses the key
   - Waits for 1 more keyboard read (confirms key was processed)
2. This prevents dropped characters!

**Important:** This is NOT instant - it synchronizes with the Apple II's keyboard polling.

#### `waitkey` - Wait for Keyboard Read

```bash
waitkey
```

**Purpose:** Wait until the Apple II program reads the keyboard buffer (at $C000).

**When to use:**
- After typing a command, wait for program to process it
- Before switching to text mode to see output
- As synchronization points in test scripts

**Timeout:** 5 seconds default (configurable)

#### `showtext` - Display Text Screen

```bash
showtext
```

**Purpose:** Capture and display the Apple II text screen (40 or 80 columns).

**What it does:**
- Automatically detects 40-column or 80-column mode
- For 80-column: properly interleaves auxiliary and main memory
- Outputs 24 lines of text to terminal
- Converts Apple II character set to ASCII

**Usage:** Call after programs produce output to see results.

#### `expect` - Poll Screen for String Match

```bash
expect "Press any key" 30
```

**Parameters:**
- String to search for (quotes recommended)
- Timeout in seconds (optional, default 30)

**What it does:**
1. Polls screen every 500ms
2. Captures text using same logic as `showtext`
3. Checks if search string appears anywhere on screen
4. Returns immediately on match
5. Exits with error on timeout

**Usage:** Wait for specific program output before proceeding.

**Tip:** More robust than counting `waitkey` calls - programs may have variable delays.

#### `qqq` - Exit Emulator

```bash
qqq
```

**Purpose:** Completely terminate the JACE emulator (calls System.exit(0)).

**Usage:** Always use as LAST command in automated scripts to clean up properly.

### Complete Test Script Example

Here's the canonical pattern from `test_fpumf.sh`:

```bash
#!/bin/bash
# Automated test for FPUMF library

JACE_DIR="/Users/brobert/Documents/code/jace"
DISK_IMAGE="/Users/brobert/Documents/code/PLASMA/PLEIADES-MEGAFLASH-FPU.po"

cd "$JACE_DIR"

echo "==== Automated FPTEST.MF Test ===="
echo "Disk: $DISK_IMAGE"
echo ""

mvn -q exec:java -Dexec.mainClass="jace.JaceLauncher" -Dexec.args="--terminal" 2>&1 <<'EOF' | tee /tmp/fptest.log
nohints
bootdisk d1 /Users/brobert/Documents/code/PLASMA/PLEIADES-MEGAFLASH-FPU.po 7
type "+fptest.mf\n"
waitkey
waitkey
showtext
type "\n"
waitkey
showtext
type "\n"
waitkey
showtext
qqq
EOF

echo ""
echo "==== Test Complete ===="
echo "Full log saved to: /tmp/fptest.log"
```

**Breakdown:**
1. `nohints` - Skip splash screen
2. `bootdisk` - Boot the 32MB ProDOS disk on slot 7
3. `type "+fptest.mf\n"` - Run the test program
4. `waitkey` (×2) - Wait for program to load and start
5. `showtext` - Display initial output ("Press any key...")
6. `type "\n"` - Press Enter to start tests
7. `waitkey` + `showtext` - Show test results
8. Repeat for additional test phases
9. `qqq` - Exit cleanly

### Tips for Robust Test Scripts

#### 1. Use `expect` for Variable Timing

```bash
# ❌ FRAGILE - May timeout if program slow
type "+program\n"
waitkey
waitkey
waitkey
showtext

# ✅ ROBUST - Waits for actual output
type "+program\n"
expect "Ready" 10
showtext
```

#### 2. Capture Output for Analysis

```bash
# Save full session log
mvn ... <<'EOF' 2>&1 | tee /tmp/test.log
# commands...
EOF

# Then grep for failures
if grep -q "FAILED" /tmp/test.log; then
  echo "Tests failed!"
  exit 1
fi
```

#### 3. Test Multiple Programs in One Script

```bash
# Test suite
mvn ... <<'EOF'
nohints
bootdisk d1 /path/to/disk.po 7

# Test 1
type "+test1\n"
expect "PASS" 10

# Test 2
type "+test2\n"
expect "PASS" 10

# Test 3
type "+test3\n"
expect "PASS" 10

qqq
EOF
```

#### 4. Always Use Absolute Paths

```bash
# ✅ CORRECT - Works from any directory
bootdisk d1 /Users/brobert/Documents/code/PLASMA/DISK.po 7

# ❌ WRONG - Breaks if run from different directory
bootdisk d1 DISK.po 7
```

### Test Organization

**Clean organization established:**

```
/Users/brobert/Documents/code/PLASMA/
├── test_fpumf.sh          # Primary test script (canonical example)
├── test_scripts/          # Historical/development test scripts
│   ├── test_cmp_*.sh
│   ├── test_fpu_*.sh
│   └── ...
└── PLEIADES-MEGAFLASH-FPU.po  # Test disk image
```

**Pattern:**
- Keep one primary test script at root level for main testing
- Archive development/experimental scripts in `test_scripts/`
- This prevents root directory clutter while preserving history

### Debugging Test Scripts

#### Common Issues

**Problem: "Timeout waiting for keyboard read"**
- Program isn't running or crashed before reading keyboard
- Check that program actually loads (use `showtext` earlier)

**Problem: Dropped characters when typing**
- This shouldn't happen with `type` command (it synchronizes)
- If it does, the keyboard driver may have changed

**Problem: Wrong text output (40-column when expecting 80)**
- Check if program properly switches to 80-column mode
- Some programs default to 40-column text

**Problem: expect times out even though string is visible**
- String may have different case/spacing
- Use `showtext` first to verify exact string format
- Remember Apple II converts lowercase to uppercase!

### Integration with Build System

**Complete workflow:**

```bash
# 1. Make code changes
vim src/samplesrc/program.pla

# 2. Build and update disk
cd src
./xplasm -AMOW samplesrc/program.pla
acme --setpc 24574 -o rel/PROGRAM#FE6000 samplesrc/program.a
cd ..
./build_disk.sh

# 3. Verify freshness
ls -lh src/samplesrc/program.pla src/rel/PROGRAM* *.po

# 4. Run automated test
./test_program.sh

# 5. Check results
echo $?  # 0 = success
```

### Advanced: Expect with Retries

```bash
# Function to retry failed tests
run_test_with_retry() {
  local max_attempts=3
  local attempt=1

  while [ $attempt -le $max_attempts ]; do
    echo "Attempt $attempt of $max_attempts"

    if ./test_fpumf.sh; then
      echo "Test passed!"
      return 0
    fi

    echo "Test failed, retrying..."
    attempt=$((attempt + 1))
    sleep 2
  done

  echo "Test failed after $max_attempts attempts"
  return 1
}
```

### Reference Documentation

**For deep details on JACE terminal implementation:**
- `/Users/brobert/Documents/code/jace/CLAUDE.md`
  - Complete terminal command reference
  - 80-column text handling details
  - Keyboard synchronization implementation
  - Memory operations and boot detection

**Key implementation files:**
- `jace/src/main/java/jace/terminal/MainMode.java` - Terminal commands
- All commands implemented with proper error handling

---

## Quick Reference Tables

### Common Crash Addresses

| Crash Address | Likely Cause | Check |
|--------------|--------------|-------|
| 0002 | Bad function call | Module syntax (: not =>) |
| 0007 | Stack corruption | Uncaptured return values |
| 06FB | Text memory (bad RTS) | Stack corruption from uncaptured returns |
| B303 | Mouse driver issue | Mouse initialization sequence |

### Memory Map Reference

| Address Range | Purpose | Max Program Size |
|--------------|---------|------------------|
| $0800-$1FFF | Small programs | 6KB |
| $2000-$5FFF | HGR graphics (DO NOT USE) | - |
| $6000-$95FF | Large programs | 13.5KB |

### Build Chain Troubleshooting

| Problem | Symptom | Solution |
|---------|---------|----------|
| .a older than .pla | Changes don't appear | `./xplasm -AMOW samplesrc/program.pla` |
| REL older than .a | Program doesn't update | `make rel/PROGRAM#FE6000` |
| Disk older than REL | Testing stale code | `./build_disk.sh` |
| Random crashes | HGR memory collision | Load at $6000, not $1000 |

### Top 10 Mistakes

1. **Wrong load address** for large programs ($1000 when >4KB)
2. **Uncaptured return values** (conio:getkey without assignment)
3. **Stale disk images** (didn't verify build freshness)
4. **Large stack allocations** (>20 bytes on stack)
5. **fpu:pushInt without @ operator** (produces Inf/NaN)
6. **Module syntax** (=> instead of :)
7. **Unbalanced SANE ZP state** (saveZP without restoreZP)
8. **Function side effects before validation** (modifying state then failing)
9. **Inverted comparison logic** (checking FPUCMPLT when should check FPUCMPGT)
10. **ACME errors without checking PLASMA source** (need to refactor complex functions)

---

## Essential Documentation

### Core References

- **PLASMA Language**: `doc/PLASMA.md` - Read this first!
- **Build System**: `src/makefile`
- **MegaFlash FPU**: `doc/MEGAFLASH_FPU.md`

### Include Files (API Documentation)

```bash
src/inc/conio.plh      # Console I/O
src/inc/fpu.plh        # Floating point
src/inc/mouse.plh      # Mouse input
src/dhgr.tk/inc/dhgrlib.plh      # DHGR graphics
src/dhgr.tk/inc/dhgrutils.plh    # DHGR utilities
```

**Include files show:**
- Function signatures (return value counts!)
- Constant definitions
- Structure layouts

### Essential Sample Programs

| Program | Study For | Key Lessons |
|---------|-----------|-------------|
| `samplesrc/rpncalc.pla` | FPU usage | Safe FPU patterns |
| `samplesrc/mousetest.pla` | Mouse handling | Correct module calls |
| `samplesrc/hgrogue.pla` | Graphics + console | Mode switching |
| `samplesrc/dgrtest.pla` | DHGR graphics | Line drawing, color |
| `samplesrc/coniotest.pla` | Console I/O | All conio functions |

**When stuck:** Find a sample that does something similar, copy its patterns exactly.

---

## Keys to Success

1. **Verify build freshness** - Check timestamps after EVERY build
2. **Use proper module syntax** - `:` not `=>`
3. **Capture return values** - Check function signatures in .plh files
4. **Load at correct address** - $6000 for programs >4KB
5. **Global buffers for large data** - Stack is tiny on Apple II
6. **Use @ for FPU operations** - `fpu:pushInt(@var)` not `fpu:pushInt(var)`
7. **Debug incrementally** - Strip to minimum, build back up
8. **Study sample programs** - Copy working patterns
9. **Read assembly output** - .a files reveal crash causes
10. **Reserve memory for graphics** - Use proper sysflags

---

*This guide reflects lessons learned from developing a Mandelbrot set renderer with DHGR graphics, FPU operations, and mouse input. Many hours of debugging were condensed into these patterns. Last updated: 2026-01-30*
