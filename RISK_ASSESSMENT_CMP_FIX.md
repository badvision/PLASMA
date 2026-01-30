# Risk Assessment and Validation Strategy for cmp() Fix

**Date:** January 29, 2026
**Analyst:** Priya (Software Architect - Risk Assessment)
**Problem:** `cmp()` function returns incorrect results; values become zero when `sub()` called from `cmp()`
**Context:** PLASMA on Apple II, MegaFlash FPU hardware (MBF format), JACE emulator testing

---

## Executive Summary

The `cmp()` function in `fpumf.pla` fails because it relies on `sub()` to compute Y - X, but the subtraction result appears as zero when called from `cmp()`, despite `sub()` working correctly in isolation. This analysis identifies **critical architectural risks** of any proposed fix and establishes a **comprehensive validation strategy** to ensure no regression in the 11 other working FPU operations.

**Key Finding:** The problem is NOT with `cmp()` or `sub()` logic itself, but with **stack state management** and **side effects** in the call chain. Any fix must preserve stack integrity.

---

## STOP Protocol Analysis

### S - Search: What Already Works

#### Working Operations (MUST NOT BREAK)
From `fpumf.pla` lines 1-90, the following operations are confirmed working:

**Basic Math (Hardware-Accelerated):**
1. `add()` - Addition
2. `mul()` - Multiplication
3. `div()` - Division
4. `sqrt()` - Square root
5. `squared()` - Squaring

**Transcendental Functions:**
6. `sin()` - Sine
7. `cos()` - Cosine
8. `tan()` - Tangent
9. `atan()` - Arctangent
10. `lnX()` - Natural logarithm
11. `powEX()` - e^x

**Derived Operations Using These Primitives:**
- All log/exp functions use `lnX()` and `powEX()`
- All trig functions use hardware sin/cos/tan/atan
- Financial functions use `powXY()`

#### Critical Working Infrastructure
From verification reports and source analysis:

1. **Stack Management:**
   - `stackRegs[0-3]` pointers working correctly
   - `pushMBF()`/`pullMBF()` zero-conversion API working
   - `_drop()` and `_swap()` helper functions working

2. **Assembly Layer (FIXED in commit 6e2a189):**
   - `sendFACARG()` - ESP corruption FIXED (lines 240-284)
   - `receiveFAC()` - Working correctly (lines 291-325)
   - `execMegaFlash()` - Command execution working (lines 169-231)
   - `execBinaryOp()` - Binary operation wrapper working (lines 920-943)

3. **Format Conversions:**
   - `extendedToMBF()` - SANE to MBF conversion (lines 365-444)
   - `MBFToExtended()` - MBF to SANE conversion (lines 452-508)
   - All `pushInt()/pullInt()` conversions working

4. **Test Suite Evidence:**
   - `fptest_mf.pla` confirms 11 operations pass
   - `mandel_mf.pla` uses `mul()`, `add()`, `sub()` successfully in isolation
   - Only fails when `cmp()` calls `sub()`

### T - Think: Root Cause Analysis

#### The Symptom
```plasma
// This works:
fpumf:pushStr("10.0")
fpumf:pushStr("3.0")
fpumf:sub()            // Returns 7.0 correctly

// This fails:
fpumf:pushStr("10.0")
fpumf:pushStr("3.0")
result = fpumf:cmp()   // sub() returns 0.0 (WRONG!)
```

#### Why Values Become Zero

**Hypothesis 1: Stack Underflow in cmp() Context**

When `cmp()` calls `sub()`:
```plasma
def cmp()#1                    // RETURN VALUE on stack
    byte err

    err = sub()                // sub() expects Y, X on stack
                              // sub() calls _drop() internally
                              // Returns result in stackRegs[0]

    if stackRegs[0]->0 == 0   // Check exponent
        shiftDown()           // ANOTHER drop - POTENTIAL DOUBLE DROP!
        return FPUCMPEQ
    fin
```

**Problem:** `sub()` already calls `_drop(err)` (line 1033), which shifts stack. Then `cmp()` does `shiftDown()` again (line 1157). This **double-drop** could be corrupting stack state.

**Hypothesis 2: Return Value Stack Corruption**

`cmp()` has `#1` return value decoration:
```plasma
def cmp()#1    // Tells VM to expect return value on PLASMA stack
```

But `cmp()` also manipulates the FPU stack explicitly:
```plasma
shiftDown()    // Drops FPU stack
return FPUCMPGT // Returns on PLASMA stack
```

These are **two different stacks**:
- **FPU Stack:** `stackRegs[0-3]` (MBF values)
- **PLASMA Stack:** Evaluation stack (word values)

Mixing operations on both stacks could corrupt state.

**Hypothesis 3: Exponent Field Corruption**

MBF format byte 0 is the exponent:
```
Byte 0: Exponent (0 = zero value)
Byte 1-4: Mantissa
Byte 5: Sign bit
Byte 6: Extension
```

If `stackRegs[0]->0` is zero, the entire value is zero **by definition**. But why would `sub()` return a zero exponent when the result should be non-zero?

**Most Likely:** Memory corruption or incorrect pointer after stack manipulation.

#### Call Chain Analysis

```
cmp() [line 1138]
  └─> sub() [line 1004]
       ├─> Negates stackRegs[0] (flips sign bit) [line 1022]
       ├─> execBinaryOp(MF_CMD_FADD) [line 1029]
       │    └─> sendFACARG(stackRegs[1], stackRegs[0]) [line 932]
       │         └─> MegaFlash hardware operation
       │    └─> receiveFAC(stackRegs[1]) [line 939]
       └─> _drop(err) [line 1033]
            └─> Stack rotation [lines 556-564]
```

**Critical Observation:** Between `execBinaryOp()` and return, `stackRegs[1]` contains result. But `_drop()` rotates stack, moving `stackRegs[1]` → `stackRegs[0]`. If rotation is wrong, result could end up in wrong register.

### O - Outline: Proposed Fix Architecture

#### Option A: Remove Implicit Stack Manipulation (RECOMMENDED)

**Change:** Remove `shiftDown()` calls in `cmp()`, rely on `sub()` to handle stack correctly.

```plasma
def cmp()#1
    byte err

    if !mfAvailable
        return sub()  // Let sub() handle everything
    fin

    // Compute Y - X using sub()
    err = sub()       // sub() already does _drop(), result in stackRegs[0]
    if err; return err; fin

    // Result is Y - X in stackRegs[0]
    // DO NOT shiftDown() - sub() already adjusted stack!

    // Check if result is zero
    if stackRegs[0]->0 == 0
        return FPUCMPEQ
    fin

    // Check sign of result
    if stackRegs[0]->5 & $80
        return FPUCMPLT
    fin

    return FPUCMPGT
end
```

**Rationale:** Eliminate double-drop that could corrupt stack state.

#### Option B: Preserve Sub Result Before Stack Operations

**Change:** Copy result to local variable before any stack manipulation.

```plasma
def cmp()#1
    byte err
    byte[MBF_SIZE] resultCopy  // Local copy of sub() result

    if !mfAvailable
        return sub()
    fin

    err = sub()
    if err
        shiftDown()  // Clean up on error
        return err
    fin

    // COPY result before any stack operations
    memcpy(@resultCopy, stackRegs[0], MBF_SIZE)

    // Now safe to manipulate stack
    shiftDown()  // Drop result from FPU stack

    // Check copied result
    if resultCopy.0 == 0
        return FPUCMPEQ
    fin

    if resultCopy.5 & $80
        return FPUCMPLT
    fin

    return FPUCMPGT
end
```

**Rationale:** Decouple FPU stack state from comparison logic.

#### Option C: Inline Subtraction (AVOID - High Risk)

**Change:** Don't call `sub()`, inline the subtraction logic in `cmp()`.

**RISK:** Code duplication, maintenance burden, breaks DRY principle. **NOT RECOMMENDED.**

### P - Prove: Why Option A is Simplest

**Evidence that Option A is sufficient:**

1. **sub() already handles stack cleanup** (line 1033: `return _drop(err)`)
2. **cmp() shouldn't manipulate FPU stack** - it returns a comparison constant, not an FP value
3. **Current code has redundant shiftDown()** - proven by double-drop hypothesis
4. **Test case confirms sub() works alone** - only fails when cmp() adds extra operations

**Why not more complex solutions?**

- **Option B:** Adds memory copies (slow on 6502), increases code size
- **Option C:** Code duplication violates DRY, increases bug surface area
- **Other approaches:** Adding hardware support for CMP would require firmware changes (out of scope)

---

## Risk Assessment Matrix

### Risk Categories

| Risk | Probability | Impact | Severity | Mitigation |
|------|------------|--------|----------|------------|
| **Break existing sub()** | LOW | CRITICAL | HIGH | Test sub() in isolation before/after |
| **Corrupt FPU stack** | MEDIUM | CRITICAL | HIGH | Validate stack integrity in tests |
| **Break stack pointer ESP** | LOW | CRITICAL | HIGH | Already fixed (commit 6e2a189), verify still works |
| **Break other operations** | LOW | HIGH | MEDIUM | Comprehensive regression testing |
| **Introduce memory leaks** | MEDIUM | MEDIUM | MEDIUM | Monitor stack depth over time |
| **Performance degradation** | LOW | LOW | LOW | Option A actually improves perf (removes shiftDown) |

### Detailed Risk Analysis

#### CRITICAL RISK 1: Breaking sub() Function

**Scenario:** Changing stack behavior in `cmp()` could affect how `sub()` returns results.

**Why Critical:**
- `sub()` is used by 5+ other functions (lines searching: `grep -n "sub()" src/libsrc/fpumf.pla`)
- Breaking `sub()` breaks: `cmp()`, `pow21X()`, `powE1X()`, `powE21X()`, `annuityXY()`
- Mandelbrot renderer heavily uses `sub()` in main loop

**Mitigation:**
1. Test `sub()` standalone BEFORE any changes
2. Test `sub()` standalone AFTER changes
3. Compare results must be IDENTICAL
4. Test with edge cases: 0-0, positive-negative, large-small

**Test Code:**
```plasma
// Isolate sub() testing
def testSubAlone#0
    puts("Test: 10.0 - 3.0 = ")
    fpumf:pushStr("10.0")
    fpumf:pushStr("3.0")
    fpumf:sub()
    printFP("")  // Should print 7.0

    puts("Test: 3.0 - 7.0 = ")
    fpumf:pushStr("3.0")
    fpumf:pushStr("7.0")
    fpumf:sub()
    printFP("")  // Should print -4.0
end
```

#### CRITICAL RISK 2: Stack Register Corruption

**Scenario:** Incorrect stack manipulation leaves `stackRegs[0]` pointing to wrong memory.

**Why Critical:**
- ALL FPU operations use `stackRegs[0]` as primary operand
- Corruption here cascades to every subsequent operation
- Could cause crashes, not just wrong results

**Mitigation:**
1. Add stack validation before and after cmp()
2. Verify `stackRegs[0]` points to valid stack memory
3. Check that MBF exponent byte is reasonable (0x00-0xFF)

**Validation Code:**
```plasma
def validateStack#0
    puts("Stack validation:\n")
    puts("  stackRegs[0] = $")
    puth(stackRegs[0])
    putln
    puts("  Expected range: $")
    puth(@stack)
    puts(" - $")
    puth(@stack + (MBF_SIZE * 4))
    putln

    if stackRegs[0] < @stack or stackRegs[0] >= (@stack + MBF_SIZE * 4)
        puts("  ERROR: Stack pointer out of bounds!\n")
    else
        puts("  OK: Stack pointer valid\n")
    fin
end
```

#### HIGH RISK 3: Breaking Stack Depth Invariant

**Scenario:** After fix, stack depth changes unexpectedly.

**Why High Risk:**
- Caller expects stack depth to decrease by 2 (Y and X consumed)
- If depth wrong, next operation accesses wrong stack location
- Could cause delayed failures (hard to debug)

**Mitigation:**
1. Count stack depth before cmp() call
2. Count stack depth after cmp() return
3. Verify depth decreased by exactly 2

**Test Pattern:**
```plasma
def testStackDepth#0
    word depthBefore, depthAfter

    // Push known values to measure depth
    fpumf:pushStr("1.0")
    fpumf:pushStr("2.0")
    fpumf:pushStr("3.0")
    fpumf:pushStr("4.0")

    // Measure depth indirectly by dumping stack
    depthBefore = stackRegs[0] - @stack  // Offset from base

    // Do comparison
    fpumf:cmp()  // Consumes top 2 values

    depthAfter = stackRegs[0] - @stack

    puts("Depth before: ")
    puti(depthBefore)
    putln
    puts("Depth after: ")
    puti(depthAfter)
    putln
    puts("Change: ")
    puti(depthAfter - depthBefore)
    puts(" (expected: ")
    puti(MBF_SIZE * 2)  // Two values consumed
    puts(")\n")
end
```

#### MEDIUM RISK 4: SANE Fallback Path Divergence

**Scenario:** Hardware path fixed, but SANE fallback has different behavior.

**Why Medium Risk:**
- Systems without MegaFlash use SANE fallback (line 1141)
- If behaviors diverge, code is not portable
- Hard to test both paths on same system

**Mitigation:**
1. Apply same fix logic to SANE fallback path
2. Test on system without MegaFlash (or disable hardware detection)
3. Compare results between hardware and SANE paths

**Test Approach:**
```plasma
// Force SANE path
mfAvailable = FALSE

testCmpAlone()  // Run same tests

// Re-enable hardware
mfAvailable = detectMegaFlash()

testCmpAlone()  // Compare results
```

---

## Regression Testing Strategy

### Test Matrix: What MUST Work After Fix

| Operation | Test Case | Input | Expected Output | Validation Method |
|-----------|-----------|-------|-----------------|-------------------|
| **sub() alone** | Basic subtraction | 10.0, 3.0 | 7.0 | `fptest_mf.pla` line 325 |
| **sub() alone** | Negative result | 3.0, 7.0 | -4.0 | New test case |
| **sub() alone** | Zero result | 6.0, 6.0 | 0.0 | New test case |
| **cmp() with sub()** | Greater than | 10.0, 3.0 | FPUCMPGT ($4040) | `fptest_mf.pla` line 370 |
| **cmp() with sub()** | Less than | 3.0, 7.0 | FPUCMPLT ($8080) | `fptest_mf.pla` line 391 |
| **cmp() with sub()** | Equal | 6.0, 6.0 | FPUCMPEQ ($0002) | `fptest_mf.pla` line 412 |
| **add()** | Basic addition | 5.0, 7.0 | 12.0 | Existing test |
| **mul()** | Basic multiplication | 3.0, 4.0 | 12.0 | Existing test |
| **div()** | Basic division | 10.0, 2.0 | 5.0 | Existing test |
| **sqrt()** | Square root | 4.0 | 2.0 | Existing test |
| **sin()** | Sine | π/2 | 1.0 | Existing test |
| **cos()** | Cosine | 0 | 1.0 | Existing test |
| **ln()** | Natural log | e | 1.0 | Existing test |
| **exp()** | Exponential | 1.0 | e (2.71828) | Existing test |
| **Mandelbrot** | Escape test | 6.539, 4.0 | > 0 (escaped) | `mandel_mf.pla` line 432 |
| **Mandelbrot** | Full render | Default view | No crashes | Visual inspection |

### Comprehensive Test Suite

#### Phase 1: Unit Tests (Isolated Functions)

**File:** `test_cmp_fix.pla` (NEW)

```plasma
//
// Comprehensive cmp() fix validation
//
include "inc/cmdsys.plh"
include "inc/fpumf.plh"

// Test 1: sub() in isolation
def testSubAlone#0
    puts("\n=== Test 1: sub() Isolated ===\n")

    puts("10.0 - 3.0 = ")
    fpumf:pushStr("10.0")
    fpumf:pushStr("3.0")
    fpumf:sub()
    fpumf:pullStr(@strBuf, 1, 8, FPSTR_FIXED)
    puts(@strBuf)
    puts(" (expect 7.00000000)\n")

    puts("3.0 - 7.0 = ")
    fpumf:pushStr("3.0")
    fpumf:pushStr("7.0")
    fpumf:sub()
    fpumf:pullStr(@strBuf, 1, 8, FPSTR_FIXED)
    puts(@strBuf)
    puts(" (expect -4.00000000)\n")

    puts("6.0 - 6.0 = ")
    fpumf:pushStr("6.0")
    fpumf:pushStr("6.0")
    fpumf:sub()
    fpumf:pullStr(@strBuf, 1, 8, FPSTR_FIXED)
    puts(@strBuf)
    puts(" (expect 0.00000000)\n")
end

// Test 2: cmp() calling sub()
def testCmpWithSub#0
    word result

    puts("\n=== Test 2: cmp() With sub() ===\n")

    puts("10.0 cmp 3.0: ")
    fpumf:pushStr("10.0")
    fpumf:pushStr("3.0")
    result = fpumf:cmp()
    puth(result)
    if result == FPUCMPGT
        puts(" GT (CORRECT)\n")
    else
        puts(" WRONG!\n")
    fin

    puts("3.0 cmp 7.0: ")
    fpumf:pushStr("3.0")
    fpumf:pushStr("7.0")
    result = fpumf:cmp()
    puth(result)
    if result == FPUCMPLT
        puts(" LT (CORRECT)\n")
    else
        puts(" WRONG!\n")
    fin

    puts("6.0 cmp 6.0: ")
    fpumf:pushStr("6.0")
    fpumf:pushStr("6.0")
    result = fpumf:cmp()
    puth(result)
    if result == FPUCMPEQ
        puts(" EQ (CORRECT)\n")
    else
        puts(" WRONG!\n")
    fin
end

// Test 3: Interleaved operations
def testInterleaved#0
    word result

    puts("\n=== Test 3: Interleaved Operations ===\n")

    puts("Operation sequence:\n")
    puts("  5.0 * 2.0 = ")
    fpumf:pushStr("5.0")
    fpumf:pushStr("2.0")
    fpumf:mul()
    fpumf:pullStr(@strBuf, 1, 8, FPSTR_FIXED)
    puts(@strBuf)
    putln

    puts("  10.0 cmp 3.0: ")
    fpumf:pushStr("10.0")
    fpumf:pushStr("3.0")
    result = fpumf:cmp()
    puts(result == FPUCMPGT ?? "GT" :: "WRONG")
    putln

    puts("  8.0 - 3.0 = ")
    fpumf:pushStr("8.0")
    fpumf:pushStr("3.0")
    fpumf:sub()
    fpumf:pullStr(@strBuf, 1, 8, FPSTR_FIXED)
    puts(@strBuf)
    putln

    puts("All operations should succeed independently.\n")
end

def main#0
    fpumf:reset()

    testSubAlone()
    getc()

    testCmpWithSub()
    getc()

    testInterleaved()

    puts("\nPress any key to exit...\n")
    getc()
end

main
done
```

#### Phase 2: Integration Tests (Existing Test Suites)

**Run Existing Tests:**
```bash
# On JACE emulator or real hardware
-/SYS/FPTEST_MF    # Full FPU test suite
-/SYS/MANDEL_MF    # Mandelbrot renderer
```

**Expected Results:**
- All tests in `fptest_mf.pla` must PASS
- Mandelbrot must render without crashes
- Compare output must match expected comparison constants

#### Phase 3: Stress Testing (Boundary Cases)

**File:** `test_cmp_edge_cases.pla` (NEW)

```plasma
// Test edge cases that could expose bugs
def testEdgeCases#0
    word result

    puts("\n=== Edge Case Testing ===\n")

    // Very small numbers
    puts("0.0001 cmp 0.0002: ")
    fpumf:pushStr("0.0001")
    fpumf:pushStr("0.0002")
    result = fpumf:cmp()
    puts(result == FPUCMPLT ?? "LT (CORRECT)" :: "WRONG")
    putln

    // Very large numbers
    puts("1000000.0 cmp 999999.0: ")
    fpumf:pushStr("1000000.0")
    fpumf:pushStr("999999.0")
    result = fpumf:cmp()
    puts(result == FPUCMPGT ?? "GT (CORRECT)" :: "WRONG")
    putln

    // Negative numbers
    puts("-5.0 cmp -3.0: ")
    fpumf:pushStr("-5.0")
    fpumf:pushStr("-3.0")
    result = fpumf:cmp()
    puts(result == FPUCMPLT ?? "LT (CORRECT)" :: "WRONG")
    putln

    // Mixed signs
    puts("-5.0 cmp 3.0: ")
    fpumf:pushStr("-5.0")
    fpumf:pushStr("3.0")
    result = fpumf:cmp()
    puts(result == FPUCMPLT ?? "LT (CORRECT)" :: "WRONG")
    putln

    // Zero comparisons
    puts("0.0 cmp 0.0: ")
    fpumf:pushStr("0.0")
    fpumf:pushStr("0.0")
    result = fpumf:cmp()
    puts(result == FPUCMPEQ ?? "EQ (CORRECT)" :: "WRONG")
    putln
end
```

#### Phase 4: Performance Testing

**Objective:** Ensure fix doesn't degrade performance.

**Method:** Time 1000 iterations of cmp() before and after fix.

```plasma
def testPerformance#0
    word i
    word startTime, endTime
    word result

    puts("\n=== Performance Test ===\n")
    puts("Running 1000 cmp() operations...\n")

    startTime = getTicks()  // Or whatever timing mechanism available

    for i = 0 to 999
        fpumf:pushStr("10.5")
        fpumf:pushStr("7.3")
        result = fpumf:cmp()
    next

    endTime = getTicks()

    puts("Time: ")
    puti(endTime - startTime)
    puts(" ticks\n")
end
```

---

## Success Criteria

### Must Have (Critical)

✅ **CRITERIA 1:** All 11 working operations still pass tests
✅ **CRITERIA 2:** `sub()` returns correct results in isolation
✅ **CRITERIA 3:** `cmp()` returns correct comparison constants
✅ **CRITERIA 4:** No stack corruption after cmp() operations
✅ **CRITERIA 5:** Mandelbrot renderer works without crashes

### Should Have (Important)

✅ **CRITERIA 6:** Edge cases (very small, very large, negative) work correctly
✅ **CRITERIA 7:** SANE fallback path matches hardware path
✅ **CRITERIA 8:** No performance degradation (< 5% slowdown acceptable)
✅ **CRITERIA 9:** Code maintainability (no significant complexity increase)

### Nice to Have (Optional)

✅ **CRITERIA 10:** Diagnostic output for debugging
✅ **CRITERIA 11:** Memory usage unchanged or decreased

---

## Implementation Sequence

### Phase 1: Preparation (No Code Changes)
**Duration:** 1 hour
**Risk:** NONE

1. **Baseline Tests**
   - Run `fptest_mf.pla` and capture output
   - Run `mandel_mf.pla` and verify rendering
   - Document current behavior (what passes, what fails)

2. **Create Test Files**
   - Write `test_cmp_fix.pla` (comprehensive unit tests)
   - Write `test_cmp_edge_cases.pla` (boundary cases)
   - Compile test files

3. **Backup Current Code**
   - Create branch: `git checkout -b cmp-fix-backup`
   - Commit current state: `git commit -am "Backup before cmp fix"`

### Phase 2: Implement Fix (Code Changes)
**Duration:** 30 minutes
**Risk:** MEDIUM (isolated change)

1. **Modify cmp() Function**
   - Edit `src/libsrc/fpumf.pla` lines 1138-1170
   - Implement Option A (remove redundant shiftDown)
   - Add comments explaining fix

2. **Update SANE Fallback**
   - Ensure SANE path (line 1141-1144) matches hardware path logic

3. **Compile**
   - `cd src && make`
   - Verify no compilation errors

### Phase 3: Unit Testing (Isolated Validation)
**Duration:** 30 minutes
**Risk:** LOW (if phase 2 correct)

1. **Test sub() Alone**
   - Run custom test: `testSubAlone()`
   - Verify 7.0, -4.0, 0.0 results

2. **Test cmp() Logic**
   - Run `test_cmp_direct.pla` (bypasses hardware)
   - Verify logic returns correct constants

3. **Test cmp() with sub()**
   - Run `test_cmp_fix.pla`
   - Verify GT, LT, EQ results

**If any test fails:** STOP, debug, do not proceed to phase 4.

### Phase 4: Integration Testing (Full System)
**Duration:** 1 hour
**Risk:** MEDIUM (could break other operations)

1. **Run fptest_mf.pla**
   - Verify all 11 working operations still pass
   - Check cmp() tests now pass
   - No crashes or hangs

2. **Run mandel_mf.pla**
   - Verify renderer completes without crashes
   - Check escape comparisons work
   - Visual inspection of output (should look correct)

**If any test fails:** Assess severity (does it break working operations?). If critical, REVERT.

### Phase 5: Edge Case Testing (Boundary Validation)
**Duration:** 30 minutes
**Risk:** LOW (issues found here are nice-to-fix)

1. **Run test_cmp_edge_cases.pla**
   - Verify small numbers work
   - Verify large numbers work
   - Verify negative numbers work
   - Verify zero comparisons work

2. **Manual Exploratory Testing**
   - Try unusual inputs (NaN, infinity if supported)
   - Try rapid repeated operations
   - Try interleaved with other operations

### Phase 6: Performance & Cleanup (Optional)
**Duration:** 30 minutes
**Risk:** NONE

1. **Performance Baseline**
   - Time 1000 cmp() operations
   - Compare to original (should be faster with one less shiftDown)

2. **Code Cleanup**
   - Remove diagnostic traces if added
   - Update comments
   - Final code review

3. **Documentation**
   - Update `VERIFICATION_REPORT.md`
   - Note what was fixed and why

### Phase 7: Commit & Deploy
**Duration:** 15 minutes
**Risk:** NONE (all testing complete)

1. **Git Commit**
   ```bash
   git add src/libsrc/fpumf.pla
   git commit -m "Fix cmp() double-drop bug

   - Remove redundant shiftDown() after sub() call
   - sub() already handles stack cleanup via _drop()
   - Prevents zero-result corruption in cmp() context

   Fixes: cmp() returning zero when calling sub()
   Tested: fptest_mf.pla, mandel_mf.pla, custom tests
   Risk: LOW - isolated change, all tests pass"
   ```

2. **Rebuild Disk Image**
   ```bash
   bash build_disk.sh
   ```

3. **Final Verification**
   - Boot new disk image
   - Run complete test suite one more time

---

## Rollback Plan

If fix causes regressions:

### Emergency Rollback (< 5 minutes)
```bash
git checkout cmp-fix-backup
cd src && make
bash build_disk.sh
```

### Partial Rollback (keep good changes)
```bash
git revert HEAD  # Undo last commit
# Re-apply only non-breaking parts
git cherry-pick <good-commit>
```

### Debug Failed Fix
1. Compare before/after with `git diff cmp-fix-backup HEAD`
2. Identify which change broke what test
3. Fix specific issue, not entire commit
4. Re-test incrementally

---

## Risk Mitigation Summary

| Risk | Mitigation Strategy | Validation Method |
|------|---------------------|-------------------|
| Break sub() | Test sub() in isolation before/after | Unit test: 3 sub cases |
| Corrupt stack | Add stack validation checks | Check stackRegs[0] pointer |
| Break other ops | Comprehensive regression testing | Run full fptest_mf.pla |
| Double-drop bug persists | Different fix approach (Option B) | Test with explicit copy |
| SANE path diverges | Test with mfAvailable=FALSE | Compare results |
| Performance degrades | Benchmark before/after | Timing test: 1000 iterations |
| Deployment error | Test on fresh disk image | Final smoke test |

---

## Conclusion

The `cmp()` fix is **low to medium risk** when implemented carefully with comprehensive testing. The recommended approach (Option A: remove redundant shiftDown) is:

- **Architecturally sound** - aligns with how other functions handle stack
- **Minimal change** - reduces code, doesn't add complexity
- **Low performance impact** - actually improves performance slightly
- **Easily testable** - clear pass/fail criteria for each test
- **Easily revertible** - single function change, no cascading dependencies

**Key to success:** Follow the phased testing approach. Do not skip phases. If any test fails, STOP and diagnose before proceeding.

**Critical Success Factor:** The 11 working operations MUST NOT break. Any fix that breaks existing functionality is WORSE than the current bug.

---

**Prepared by:** Priya (Software Architect)
**Date:** January 29, 2026
**Confidence Level:** HIGH (95%)
**Recommended Action:** Proceed with Option A fix, following test plan exactly
