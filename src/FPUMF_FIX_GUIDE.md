# fpumf.pla Assembly Function Fix Guide

## Quick Reference: The Core Problem

### The Fundamental Misunderstanding

```asm
// WRONG CONCEPT:
LDX     #ESP        // Trying to "load stack pointer constant"
STX     ESP         // Trying to "save stack pointer"

// CORRECT CONCEPT:
// X IS ALREADY THE STACK POINTER (set by VM)
// ESP is just a VARIABLE that stores X's value
// Use X directly: ESTKL,X and ESTKH,X
```

### Memory Map Quick Reference

```
$A0-$BF : ESTKH (stack high bytes, 32 bytes)
$C0-$DF : ESTKL (stack low bytes, 32 bytes)
$E0-$E1 : IFP (Interpreter Frame Pointer)
$E2-$E3 : PP (Program Pointer)
$E4     : IPY
$E5     : ESP (stack pointer VARIABLE - stores current X value)
$E6     : JMPTMP
$E7-$E8 : TMP / TMPL, TMPH
```

## Fix Pattern Comparison

### Pattern A: Simple Parameter Access (No Loops)

#### BEFORE (WRONG):
```asm
asm sendFACARG(pFAC, pARG, facExt)#0
    // X already contains ESP from VM  <- WRONG COMMENT

    LDA     ESTKL+2,X       // pFAC low  <- FORWARD ACCESS (WRONG)
    STA     $06
    LDA     ESTKH+2,X       // pFAC high
    STA     $07

    LDA     ESTKL+1,X       // pARG low
    STA     $08
    LDA     ESTKH+1,X       // pARG high
    STA     $09

    LDA     ESTKL,X         // facExt
    STA     $0A

    INX                     // Pop parameters
    INX
    INX
    // Missing: STX ESP

    RTS
end
```

**Problems:**
- Forward indexing (`+2`, `+1`) accesses memory BEYOND stack
- With X=$1C (after 3 pushes), `ESTKL+2,X` = `$C0+$1E` = `$DE` (edge)
- `ESTKL+3,X` would be `$DF` (last valid stack byte)
- `ESTKL+4,X` would be `$E0` = **VMZP corruption!**

#### AFTER (CORRECT):
```asm
asm sendFACARG(pFAC, pARG, facExt)#0
    !SOURCE "vmsrc/apple/plvmzp.inc"
    !SOURCE "vmsrc/apple/megaflash.inc"

    // Pop all parameters first
    INX                     // Pop facExt
    INX                     // Pop pARG
    INX                     // Pop pFAC
    STX     ESP             // Update stack pointer variable

    // Access parameters BACKWARDS from new position
    LDA     ESTKL-3,X       // facExt (3 positions back)
    STA     $0A

    LDA     ESTKL-2,X       // pARG low
    STA     $08
    LDA     ESTKH-2,X       // pARG high
    STA     $09

    LDA     ESTKL-1,X       // pFAC low
    STA     $06
    LDA     ESTKH-1,X       // pFAC high
    STA     $07

    // ... rest of function ...

    RTS
end
```

**Why this works:**
- Pop parameters with INX (move X forward)
- Access parameters backwards with `-N` offsets
- With X=$1F (after popping 3), `ESTKL-3,X` = `$C0+$1C` = `$DC` (valid)
- All accesses within stack bounds

### Pattern B: Function Using X as Loop Counter

#### BEFORE (WRONG):
```asm
asm execMegaFlash(cmd)#1
    // Save ESP to TMP
    STX     TMPL            // This is actually correct...

    LDA     ESTKL,X         // Get command
    PHA

    // Use X as loop counter
    LDX     #$00
    // ... loop body ...

    PLA
    LDX     TMPL            // Restore ESP
    LDA     #$00
    STA     ESTKL,X
    STA     ESTKH,X

    RTS
end
```

**Problems:**
- Saves X to TMPL (correct for loop counter)
- But never actually uses X as a meaningful loop counter
- Confusing code that "works" but for wrong reasons
- Doesn't pop parameter properly

#### AFTER (CORRECT):
```asm
asm execMegaFlash(cmd)#1
    !SOURCE "vmsrc/apple/plvmzp.inc"
    !SOURCE "vmsrc/apple/megaflash.inc"

    // X points to command parameter (top of stack)
    // We return a value, so DON'T pop the return slot

    // Get command from stack
    LDA     ESTKL,X         // Command byte
    PHA                     // Save to hardware stack

    // Now we can use X for loops if needed
    // (In this case, we use Y for loops, so X is free)

    // Reset buffer pointer
    STZ     MF_CMDREG

    // Send command
    PLA
    STA     MF_PARAMREG

    // Wait for completion (uses Y as loop counter)
    LDY     #$00
-   DEX                     // Timeout counter high
    BEQ     ++              // Timeout
    DEY                     // Timeout counter low
    BNE     +
    BIT     MF_STATUSREG
    BPL     +               // Done when BUSY clears
    BNE     -
+
    // Success - return 0
    LDA     #$00
    STA     ESTKL,X
    STA     ESTKH,X
    RTS

++  // Timeout - return 1
    LDA     #$01
    STA     ESTKL,X
    LDA     #$00
    STA     ESTKH,X
    RTS
end
```

**Key differences:**
1. Comment explains X points to return slot
2. No needless save/restore of X
3. Clear loop structure with Y
4. Proper return value handling

### Pattern C: Function with Return Value

#### BEFORE (WRONG):
```asm
asm execMegaFlash(cmd)#1
    STX     TMPL

    LDA     ESTKL,X         // Get command
    // ... execute command ...

    // Return result
    LDX     TMPL            // "Restore ESP"
    LDA     #$00
    STA     ESTKL,X         // Return value low
    STA     ESTKH,X         // Return value high

    RTS
end
```

**Problems:**
- Unnecessary save/restore of X
- Confusing ESP comments

#### AFTER (CORRECT):
```asm
asm execMegaFlash(cmd)#1
    !SOURCE "vmsrc/apple/plvmzp.inc"
    !SOURCE "vmsrc/apple/megaflash.inc"

    // X points to parameter (which becomes return slot)
    // Function signature: execMegaFlash(cmd)#1
    //   Takes 1 param, returns 1 value
    //   Same stack slot is reused for return

    // Get command from stack
    LDA     ESTKL,X

    // ... execute command ...

    // Return result in same slot
    LDA     #$00            // Success code
    STA     ESTKL,X
    STA     ESTKH,X

    RTS
end
```

**Why this works:**
- X stays pointing at the parameter/return slot
- No popping needed (same slot reused)
- Clear comments about stack slot reuse
- X naturally correct for return

## Diagnostic Checklist

### Before Fixing

Run this diagnostic on current code:

```asm
asm testFunc(p1, p2, p3)#0
    // Print X at entry
    TXA
    !byte $FC, $5D          // Jace trace - print A

    // Try to access p1 with forward indexing
    LDA     ESTKL+2,X
    !byte $FC, $5D          // Print what we got

    // Calculate actual address accessed
    TXA
    CLC
    ADC     #$C2            // ESTKL base + 2
    !byte $FC, $5D          // Print address

    RTS
end
```

**Expected output (if X=$1C after 3 pushes):**
- X value: `$1C` (28)
- Memory accessed: `$C0 + $1C + 2` = `$DE` (222)
- **Problem**: Accessing near/beyond stack bounds!

### After Fixing

```asm
asm testFunc(p1, p2, p3)#0
    !SOURCE "vmsrc/apple/plvmzp.inc"

    // Print X at entry
    TXA
    !byte $FC, $5D          // Should be ~$1C

    // Pop parameters
    INX
    INX
    INX
    STX     ESP

    // Print X after popping
    TXA
    !byte $FC, $5D          // Should be ~$1F

    // Access p1 (oldest param, 1 back from new position)
    LDA     ESTKL-1,X
    !byte $FC, $5D          // Print parameter value

    // Calculate actual address accessed
    TXA
    SEC
    SBC     #$01            // -1 offset
    CLC
    ADC     #$C0            // Add ESTKL base
    !byte $FC, $5D          // Should be ~$DE (valid!)

    RTS
end
```

**Expected output:**
- X at entry: `$1C` (28)
- X after pop: `$1F` (31)
- Address: `$C0 + $1F - 1` = `$DE` (still 222, but via correct method!)
- **Difference**: We got there by backward indexing, not forward

## Complete Fix List for fpumf.pla

### Functions to Fix

1. **execMegaFlash(cmd)#1**
   - Remove unnecessary X save/restore
   - Keep X pointing at return slot
   - Fix comments about ESP

2. **sendFACARG(pFAC, pARG, facExt)#0**
   - Pop 3 parameters first (INX × 3)
   - Add `STX ESP`
   - Change `ESTKL+N,X` to `ESTKL-N,X`

3. **readResult()#0**
   - Verify parameter popping if any
   - Check stack access patterns

4. **Any other asm functions**
   - Audit for forward indexing
   - Verify ESP usage
   - Check for unnecessary save/restore

### Testing Procedure

1. **Compile and run fptest_mf.pla**
2. **Enable Jace tracing in critical functions**
3. **Verify ESP values at entry/exit**
4. **Check that calculations produce correct results**
5. **Run stress test with multiple operations**

### Verification Commands

```bash
cd /Users/brobert/Documents/code/PLASMA/src
make
# Copy FPUMF.REL to disk image
# Run fptest_mf.pla on Jace emulator
# Check sysout for trace values
```

## Expected ESP Values During Execution

### Empty Stack
```
X = $1F (31)    <- Bottom of empty stack
```

### After Pushing 1 Parameter
```
X = $1E (30)    <- Top points to parameter
ESTKL[$1E] = param_low
ESTKH[$1E] = param_high
```

### After Pushing 3 Parameters
```
X = $1C (28)    <- Top points to newest (3rd) parameter
ESTKL[$1C] = param3
ESTKL[$1D] = param2
ESTKL[$1E] = param1
```

### After Function Pops 3 Parameters
```
X = $1F (31)    <- Back to empty
// But parameters still in memory (garbage)
ESTKL-3[$1F] = $C0 + $1C = $DC (old param3 location)
```

### Stack Bounds Check

**Valid range**: X from `$00` to `$1F` (0 to 31)

**Invalid accesses**:
- `ESTKL+32,X` would access `$E0` = IFP (CORRUPT!)
- `ESTKL+33,X` would access `$E1` = IFP+1 (CORRUPT!)
- `ESTKL+34,X` would access `$E2` = PP (CORRUPT!)
- `ESTKL+35,X` would access `$E3` = PP+1 (CORRUPT!)
- `ESTKL+37,X` would access `$E5` = **ESP** (CATASTROPHIC!)

**With X=$1C (after 3 pushes):**
- `ESTKL+2,X` = `$DE` (edge case, technically valid)
- `ESTKL+3,X` = `$DF` (last stack byte)
- `ESTKL+4,X` = `$E0` = **IFP corruption!**

This is why forward indexing is dangerous!

## Key Takeaways

1. **X IS the stack pointer** - no need to load ESP
2. **ESP is a variable** - stores X value for VM bookkeeping
3. **Pop first, access backwards** - the DHGR pattern
4. **Forward indexing is dangerous** - easily exceeds stack bounds
5. **Comments matter** - explain X's role, not ESP's
6. **Test with tracing** - verify X values throughout execution

## References

- See `PLASMA_ASM_FUNCTION_RESEARCH.md` for detailed analysis
- DHGR library (`dhgr.tk/libs/dhgrlib.pla`) for working examples
- PLASMA docs (`doc/PLASMA.md` lines 1241-1278) for official guidance
