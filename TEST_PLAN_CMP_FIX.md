# Comprehensive Test Plan for cmp() Fix

**Date:** January 29, 2026
**Test Lead:** Priya (QA Test Validator)
**Test Scope:** Validation of cmp() function fix without breaking 11 working FPU operations

---

## Test Objectives

1. Verify `cmp()` returns correct comparison results
2. Confirm `sub()` still works correctly in all contexts
3. Ensure no regression in 11 working FPU operations
4. Validate stack integrity after fix
5. Confirm SANE fallback path works identically
6. Verify Mandelbrot renderer works without crashes

---

## Test Environment

**Hardware:** Apple II with MegaFlash FPU card (or JACE emulator)
**Software:** PLEIADES PLASMA, fpumf library v2.0
**Test Platform:** JACE emulator (preferred for repeatability)

---

## Pre-Test Setup

### Baseline Capture (Before Fix)

```bash
# 1. Ensure clean build
cd /Users/brobert/Documents/code/PLASMA
git status  # Should show megaflash-fpu-support branch

# 2. Backup current state
git checkout -b cmp-test-baseline
git commit -am "Baseline before cmp fix"

# 3. Build current code
cd src
make clean
make

# 4. Build disk image
cd ..
bash build_disk.sh

# 5. Boot disk and run baseline tests
# (On JACE or real hardware)
# Record output of:
#   -/SYS/FPTEST_MF
#   Note which tests pass, which fail
```

**Expected Baseline:**
- 11 operations PASS
- cmp() tests FAIL (returns wrong results)
- Mandelbrot may hang or crash when using cmp()

---

## Test Suite Files

### Test File 1: test_cmp_isolated.pla

**Purpose:** Test cmp() and sub() in complete isolation

```plasma
//
// Isolated cmp() and sub() testing
// This test ONLY loads fpumf, no other libraries
//
include "inc/cmdsys.plh"
include "inc/fpumf.plh"

byte[80] strBuf

def printFP(label)#0
    fpumf:pullStr(@strBuf, 1, 8, FPSTR_FIXED)
    puts(label)
    puts(@strBuf)
    putln
end

def testSubIsolated#0
    puts("\n=== SUB() ISOLATED TESTS ===\n")

    // Test 1: Positive result
    puts("Test 1: 10.0 - 3.0 = ")
    fpumf:pushStr("10.0")
    fpumf:pushStr("3.0")
    fpumf:sub()
    printFP("")
    puts("  EXPECTED: 7.00000000\n")
    putln

    // Test 2: Negative result
    puts("Test 2: 3.0 - 7.0 = ")
    fpumf:pushStr("3.0")
    fpumf:pushStr("7.0")
    fpumf:sub()
    printFP("")
    puts("  EXPECTED: -4.00000000\n")
    putln

    // Test 3: Zero result
    puts("Test 3: 6.0 - 6.0 = ")
    fpumf:pushStr("6.0")
    fpumf:pushStr("6.0")
    fpumf:sub()
    printFP("")
    puts("  EXPECTED: 0.00000000\n")
    putln

    // Test 4: Large numbers
    puts("Test 4: 1000.0 - 999.0 = ")
    fpumf:pushStr("1000.0")
    fpumf:pushStr("999.0")
    fpumf:sub()
    printFP("")
    puts("  EXPECTED: 1.00000000\n")
    putln

    // Test 5: Small numbers
    puts("Test 5: 0.5 - 0.3 = ")
    fpumf:pushStr("0.5")
    fpumf:pushStr("0.3")
    fpumf:sub()
    printFP("")
    puts("  EXPECTED: 0.20000000 (approx)\n")
    putln

    puts("Press SPACE to continue...")
    getc()
end

def testCmpIsolated#0
    word result

    puts("\n=== CMP() ISOLATED TESTS ===\n")

    // Test 1: Greater than
    puts("Test 1: 10.0 cmp 3.0 = ")
    fpumf:pushStr("10.0")
    fpumf:pushStr("3.0")
    result = fpumf:cmp()
    puts("$")
    puth(result)
    puts("  EXPECTED: $4040 (FPUCMPGT)")
    if result == FPUCMPGT
        puts(" PASS")
    else
        puts(" FAIL")
    fin
    putln
    putln

    // Test 2: Less than
    puts("Test 2: 3.0 cmp 7.0 = ")
    fpumf:pushStr("3.0")
    fpumf:pushStr("7.0")
    result = fpumf:cmp()
    puts("$")
    puth(result)
    puts("  EXPECTED: $8080 (FPUCMPLT)")
    if result == FPUCMPLT
        puts(" PASS")
    else
        puts(" FAIL")
    fin
    putln
    putln

    // Test 3: Equal
    puts("Test 3: 6.0 cmp 6.0 = ")
    fpumf:pushStr("6.0")
    fpumf:pushStr("6.0")
    result = fpumf:cmp()
    puts("$")
    puth(result)
    puts("  EXPECTED: $0002 (FPUCMPEQ)")
    if result == FPUCMPEQ
        puts(" PASS")
    else
        puts(" FAIL")
    fin
    putln
    putln

    // Test 4: Negative numbers
    puts("Test 4: -5.0 cmp -3.0 = ")
    fpumf:pushStr("-5.0")
    fpumf:pushStr("-3.0")
    result = fpumf:cmp()
    puts("$")
    puth(result)
    puts("  EXPECTED: $8080 (FPUCMPLT, -5 < -3)")
    if result == FPUCMPLT
        puts(" PASS")
    else
        puts(" FAIL")
    fin
    putln
    putln

    // Test 5: Mixed signs
    puts("Test 5: -5.0 cmp 3.0 = ")
    fpumf:pushStr("-5.0")
    fpumf:pushStr("3.0")
    result = fpumf:cmp()
    puts("$")
    puth(result)
    puts("  EXPECTED: $8080 (FPUCMPLT)")
    if result == FPUCMPLT
        puts(" PASS")
    else
        puts(" FAIL")
    fin
    putln
    putln

    puts("Press SPACE to continue...")
    getc()
end

def testInterleavedOps#0
    word cmpResult

    puts("\n=== INTERLEAVED OPERATIONS TEST ===\n")

    puts("Sequence: mul, cmp, sub, add\n")
    putln

    // Operation 1: mul
    puts("1. 5.0 * 2.0 = ")
    fpumf:pushStr("5.0")
    fpumf:pushStr("2.0")
    fpumf:mul()
    printFP("")
    puts("   EXPECTED: 10.00000000\n")
    putln

    // Operation 2: cmp
    puts("2. 10.0 cmp 3.0 = ")
    fpumf:pushStr("10.0")
    fpumf:pushStr("3.0")
    cmpResult = fpumf:cmp()
    puts("$")
    puth(cmpResult)
    if cmpResult == FPUCMPGT
        puts(" GT PASS")
    else
        puts(" FAIL")
    fin
    putln
    putln

    // Operation 3: sub
    puts("3. 8.0 - 3.0 = ")
    fpumf:pushStr("8.0")
    fpumf:pushStr("3.0")
    fpumf:sub()
    printFP("")
    puts("   EXPECTED: 5.00000000\n")
    putln

    // Operation 4: add
    puts("4. 7.0 + 4.0 = ")
    fpumf:pushStr("7.0")
    fpumf:pushStr("4.0")
    fpumf:add()
    printFP("")
    puts("   EXPECTED: 11.00000000\n")
    putln

    puts("All operations should work independently.\n")
    puts("Press SPACE to continue...")
    getc()
end

def main#0
    puts("\n======================================\n")
    puts("  CMP() AND SUB() ISOLATED TEST SUITE\n")
    puts("======================================\n")
    putln

    fpumf:reset()

    testSubIsolated()
    testCmpIsolated()
    testInterleavedOps()

    puts("\n=== TEST COMPLETE ===\n")
    puts("Review output above.\n")
    puts("All 'PASS' = SUCCESS\n")
    puts("Any 'FAIL' = FIX NEEDED\n")
    putln
    puts("Press any key to exit...")
    getc()
end

main
done
```

### Test File 2: test_cmp_edge_cases.pla

**Purpose:** Test boundary conditions and edge cases

```plasma
//
// Edge case testing for cmp() fix validation
//
include "inc/cmdsys.plh"
include "inc/fpumf.plh"

def testEdgeCase(label, val1, val2, expected)#0
    word result

    puts(label)
    puts(": ")
    fpumf:pushStr(val1)
    fpumf:pushStr(val2)
    result = fpumf:cmp()

    when expected
        is FPUCMPGT
            puts(result == FPUCMPGT ?? "PASS (GT)" :: "FAIL")
        is FPUCMPLT
            puts(result == FPUCMPLT ?? "PASS (LT)" :: "FAIL")
        is FPUCMPEQ
            puts(result == FPUCMPEQ ?? "PASS (EQ)" :: "FAIL")
    wend
    putln
end

def main#0
    puts("\n=== EDGE CASE TESTS ===\n")
    putln

    puts("Very small numbers:\n")
    testEdgeCase("  0.0001 cmp 0.0002", "0.0001", "0.0002", FPUCMPLT)
    testEdgeCase("  0.0002 cmp 0.0001", "0.0002", "0.0001", FPUCMPGT)
    putln

    puts("Very large numbers:\n")
    testEdgeCase("  10000.0 cmp 9999.0", "10000.0", "9999.0", FPUCMPGT)
    testEdgeCase("  9999.0 cmp 10000.0", "9999.0", "10000.0", FPUCMPLT)
    putln

    puts("Negative numbers:\n")
    testEdgeCase("  -1.0 cmp -2.0", "-1.0", "-2.0", FPUCMPGT)
    testEdgeCase("  -2.0 cmp -1.0", "-2.0", "-1.0", FPUCMPLT)
    testEdgeCase("  -5.0 cmp -5.0", "-5.0", "-5.0", FPUCMPEQ)
    putln

    puts("Zero comparisons:\n")
    testEdgeCase("  0.0 cmp 0.0", "0.0", "0.0", FPUCMPEQ)
    testEdgeCase("  0.0 cmp 1.0", "0.0", "1.0", FPUCMPLT)
    testEdgeCase("  1.0 cmp 0.0", "1.0", "0.0", FPUCMPGT)
    putln

    puts("Mixed signs:\n")
    testEdgeCase("  1.0 cmp -1.0", "1.0", "-1.0", FPUCMPGT)
    testEdgeCase("  -1.0 cmp 1.0", "-1.0", "1.0", FPUCMPLT)
    putln

    puts("Press any key to exit...")
    getc()
end

main
done
```

### Test File 3: test_cmp_stack_validation.pla

**Purpose:** Validate stack integrity after cmp() operations

```plasma
//
// Stack integrity validation for cmp() fix
//
include "inc/cmdsys.plh"
include "inc/fpumf.plh"

byte[80] strBuf

// Access internal stack state (fpumf library internals)
// NOTE: This requires knowledge of fpumf internal structure
predef validateStackPointers

def printFP(label)#0
    fpumf:pullStr(@strBuf, 1, 8, FPSTR_FIXED)
    puts(label)
    puts(@strBuf)
    putln
end

def testStackDepth#0
    puts("\n=== STACK DEPTH TEST ===\n")

    // Push known values
    puts("Pushing 4 values: 1.0, 2.0, 3.0, 4.0\n")
    fpumf:pushStr("1.0")
    fpumf:pushStr("2.0")
    fpumf:pushStr("3.0")
    fpumf:pushStr("4.0")

    // Perform cmp (consumes top 2)
    puts("Calling cmp() on 4.0 and 3.0...\n")
    fpumf:cmp()

    // Stack should now have 2.0 and 1.0
    puts("Remaining stack values:\n")
    puts("  Top: ")
    printFP("")
    puts("  (should be 1.0)\n")
    puts("  Next: ")
    printFP("")
    puts("  (should be 2.0)\n")

    puts("\nIf values match, stack depth is correct.\n")
    putln
end

def testRepeatedOps#0
    word i
    word result

    puts("\n=== REPEATED OPERATIONS TEST ===\n")
    puts("Running 10 cmp() operations...\n")

    for i = 1 to 10
        fpumf:pushStr("10.0")
        fpumf:pushStr("5.0")
        result = fpumf:cmp()

        if result <> FPUCMPGT
            puts("FAIL at iteration ")
            puti(i)
            putln
            return
        fin
    next

    puts("All 10 iterations PASSED.\n")
    puts("No stack corruption detected.\n")
    putln
end

def testBackToBack#0
    word r1, r2, r3

    puts("\n=== BACK-TO-BACK CMP TEST ===\n")

    fpumf:pushStr("10.0")
    fpumf:pushStr("5.0")
    r1 = fpumf:cmp()

    fpumf:pushStr("3.0")
    fpumf:pushStr("7.0")
    r2 = fpumf:cmp()

    fpumf:pushStr("6.0")
    fpumf:pushStr("6.0")
    r3 = fpumf:cmp()

    puts("Result 1: $")
    puth(r1)
    puts(r1 == FPUCMPGT ?? " PASS (GT)" :: " FAIL")
    putln

    puts("Result 2: $")
    puth(r2)
    puts(r2 == FPUCMPLT ?? " PASS (LT)" :: " FAIL")
    putln

    puts("Result 3: $")
    puth(r3)
    puts(r3 == FPUCMPEQ ?? " PASS (EQ)" :: " FAIL")
    putln

    putln
end

def main#0
    puts("\n========================================\n")
    puts("  CMP() STACK INTEGRITY VALIDATION\n")
    puts("========================================\n")

    fpumf:reset()

    testStackDepth()
    getc()

    testRepeatedOps()
    getc()

    testBackToBack()

    puts("\nPress any key to exit...")
    getc()
end

main
done
```

---

## Test Execution Plan

### Phase 1: Pre-Fix Baseline (30 minutes)

**Objective:** Document current behavior before any changes.

**Steps:**
1. Build current code: `cd src && make clean && make`
2. Build disk: `bash build_disk.sh`
3. Boot JACE emulator with disk
4. Run existing tests:
   ```
   -/SYS/FPTEST_MF
   ```
5. **Document Results:**
   - List all tests that PASS
   - List all tests that FAIL
   - Note any crashes or hangs

**Expected Baseline Results:**
```
PASS: add(), mul(), div(), sqrt(), sin(), cos(), tan(), atan(), ln(), exp(), neg()
FAIL: cmp() tests (all return wrong results)
FAIL: Mandelbrot escape test (uses cmp())
```

**Save Output:** Capture screen output to `BASELINE_RESULTS.txt`

### Phase 2: Build New Test Files (15 minutes)

**Objective:** Compile and verify new test files work.

**Steps:**
1. Create test files:
   - `src/samplesrc/test_cmp_isolated.pla`
   - `src/samplesrc/test_cmp_edge_cases.pla`
   - `src/samplesrc/test_cmp_stack_validation.pla`

2. Add to makefile if needed (or compile manually):
   ```bash
   cd src/samplesrc
   plasm -AOSHM test_cmp_isolated.pla
   plasm -AOSHM test_cmp_edge_cases.pla
   plasm -AOSHM test_cmp_stack_validation.pla
   ```

3. Copy to disk:
   ```bash
   # Add to build_disk.sh or copy manually
   ```

4. Test files load without errors:
   ```
   -/SYS/TEST_CMP_ISOLATED
   ```
   (Should show test output, may FAIL - that's OK, we're just checking it runs)

### Phase 3: Apply Fix (15 minutes)

**Objective:** Implement the cmp() fix.

**Steps:**
1. Backup current code:
   ```bash
   git checkout -b cmp-fix-implementation
   ```

2. Edit `src/libsrc/fpumf.pla`:
   - Locate `def cmp()#1` (line 1138)
   - Remove redundant `shiftDown()` calls (lines 1150, 1157, 1163, 1168)
   - Keep ONLY result interpretation logic
   - Update comments

**BEFORE (lines 1138-1170):**
```plasma
def cmp()#1
    byte err

    if !mfAvailable
        return sub()
    fin

    err = sub()
    if err
        shiftDown()    // ← REMOVE THIS
        return err
    fin

    if stackRegs[0]->0 == 0
        shiftDown()    // ← REMOVE THIS
        return FPUCMPEQ
    fin

    if stackRegs[0]->5 & $80
        shiftDown()    // ← REMOVE THIS
        return FPUCMPLT
    fin

    shiftDown()        // ← REMOVE THIS
    return FPUCMPGT
end
```

**AFTER:**
```plasma
def cmp()#1
    byte err
    byte[MBF_SIZE] resultCopy  // Local copy of sub() result

    if !mfAvailable
        return sub()
    fin

    // Compute Y - X using sub()
    err = sub()       // sub() already does _drop(), result in stackRegs[0]
    if err
        // sub() failed, return error
        return err
    fin

    // Copy result before interpreting (stack will be cleaned by caller)
    memcpy(@resultCopy, stackRegs[0], MBF_SIZE)

    // Drop the result from FPU stack
    shiftDown()

    // Interpret the copied result
    if resultCopy.0 == 0
        return FPUCMPEQ  // Zero result = equal
    fin

    if resultCopy.5 & $80
        return FPUCMPLT  // Negative result = Y < X
    fin

    return FPUCMPGT      // Positive result = Y > X
end
```

**NOTE:** This fix uses Option B (preserve result) as safer than Option A.

3. Compile:
   ```bash
   cd src
   make clean
   make
   ```

4. Verify compilation:
   ```bash
   ls -l rel/FPUMF#FE1000
   # Should show fresh timestamp
   ```

5. Build disk:
   ```bash
   cd ..
   bash build_disk.sh
   ```

### Phase 4: Unit Testing (30 minutes)

**Objective:** Verify fix works in isolation.

**Test 4.1: Isolated sub() Test**
```
Boot disk
-/SYS/TEST_CMP_ISOLATED
```

**Expected Output:**
```
=== SUB() ISOLATED TESTS ===
Test 1: 10.0 - 3.0 = 7.00000000
  EXPECTED: 7.00000000
  ✓

Test 2: 3.0 - 7.0 = -4.00000000
  EXPECTED: -4.00000000
  ✓

Test 3: 6.0 - 6.0 = 0.00000000
  EXPECTED: 0.00000000
  ✓
```

**Pass Criteria:** All sub() tests match expected values exactly.

**Test 4.2: Isolated cmp() Test**
(Continue from same test file)

**Expected Output:**
```
=== CMP() ISOLATED TESTS ===
Test 1: 10.0 cmp 3.0 = $4040  EXPECTED: $4040 (FPUCMPGT) PASS
Test 2: 3.0 cmp 7.0 = $8080  EXPECTED: $8080 (FPUCMPLT) PASS
Test 3: 6.0 cmp 6.0 = $0002  EXPECTED: $0002 (FPUCMPEQ) PASS
Test 4: -5.0 cmp -3.0 = $8080  EXPECTED: $8080 (FPUCMPLT) PASS
Test 5: -5.0 cmp 3.0 = $8080  EXPECTED: $8080 (FPUCMPLT) PASS
```

**Pass Criteria:** All cmp() tests return correct comparison constants.

**Test 4.3: Interleaved Operations Test**
(Continue from same test file)

**Expected Output:**
```
=== INTERLEAVED OPERATIONS TEST ===
1. 5.0 * 2.0 = 10.00000000   EXPECTED: 10.00000000 ✓
2. 10.0 cmp 3.0 = $4040 GT PASS ✓
3. 8.0 - 3.0 = 5.00000000   EXPECTED: 5.00000000 ✓
4. 7.0 + 4.0 = 11.00000000   EXPECTED: 11.00000000 ✓
```

**Pass Criteria:** All operations work correctly in sequence.

**If ANY test in Phase 4 fails:** STOP, debug, do NOT proceed to Phase 5.

### Phase 5: Integration Testing (1 hour)

**Objective:** Verify no regression in existing functionality.

**Test 5.1: Full FPU Test Suite**
```
-/SYS/FPTEST_MF
```

**Expected Output:**
```
=== Testing Constants ===
PI = 3.14159265  ✓
E = 2.71828183  ✓

=== Testing Arithmetic ===
3.14159 * 2.0 = 6.28318  ✓
10.0 / 3.0 = 3.33333333  ✓
sqrt(2.0) = 1.41421356  ✓
7.0^2 = 49.00000000  ✓

=== Subtract Operations Test ===
Test 1: 10.0 - 3.0 = 7.00000000  ✓
Test 2: 5.0 - 8.0 = -3.00000000  ✓
Test 3: 4.0 - 4.0 = 0.00000000  ✓

=== Compare Operations Test ===
Test 1: 10.0 > 5.0 (CORRECT) ✓
Test 2: 3.0 < 7.0 (CORRECT) ✓
Test 3: 6.0 == 6.0 (CORRECT) ✓
Test 4: 6.539 > 4.0 (CORRECT - exceeds escape) ✓

=== Testing Trigonometry ===
sin(PI/2) = 1.00000000  ✓
cos(0) = 1.00000000  ✓
tan(PI/4) = 1.00000000  ✓
atan(1.0) = 0.78539816  ✓

=== Testing Log/Exp ===
ln(e) = 1.00000000  ✓
e^1 = 2.71828183  ✓
e^0 = 1.00000000  ✓

=== All Tests Complete ===
```

**Pass Criteria:**
- ALL existing tests still PASS
- NEW cmp() tests now PASS
- No crashes or hangs

**Test 5.2: Mandelbrot Renderer**
```
-/SYS/MANDEL_MF
```

**Actions:**
1. Let it render for 30 seconds
2. Check for visual progress (pixels being drawn)
3. Press TAB to check settings work
4. Press ESC to exit cleanly

**Pass Criteria:**
- Renderer starts and draws pixels
- No crashes or freezes
- cmp() used in escape test works correctly
- Exit is clean (no system hang)

**Visual Check:** Mandelbrot set should have recognizable shape (if rendering completes).

### Phase 6: Edge Case Testing (30 minutes)

**Objective:** Verify boundary conditions don't cause issues.

**Test 6.1: Edge Cases**
```
-/SYS/TEST_CMP_EDGE_CASES
```

**Expected Output:**
```
=== EDGE CASE TESTS ===

Very small numbers:
  0.0001 cmp 0.0002: PASS (LT) ✓
  0.0002 cmp 0.0001: PASS (GT) ✓

Very large numbers:
  10000.0 cmp 9999.0: PASS (GT) ✓
  9999.0 cmp 10000.0: PASS (LT) ✓

Negative numbers:
  -1.0 cmp -2.0: PASS (GT) ✓
  -2.0 cmp -1.0: PASS (LT) ✓
  -5.0 cmp -5.0: PASS (EQ) ✓

Zero comparisons:
  0.0 cmp 0.0: PASS (EQ) ✓
  0.0 cmp 1.0: PASS (LT) ✓
  1.0 cmp 0.0: PASS (GT) ✓

Mixed signs:
  1.0 cmp -1.0: PASS (GT) ✓
  -1.0 cmp 1.0: PASS (LT) ✓
```

**Pass Criteria:** All edge case tests PASS.

**Test 6.2: Stack Integrity**
```
-/SYS/TEST_CMP_STACK_VALIDATION
```

**Expected Output:**
```
=== STACK DEPTH TEST ===
Pushing 4 values: 1.0, 2.0, 3.0, 4.0
Calling cmp() on 4.0 and 3.0...
Remaining stack values:
  Top: 2.00000000  (should be 2.0) ✓
  Next: 1.00000000  (should be 1.0) ✓

=== REPEATED OPERATIONS TEST ===
Running 10 cmp() operations...
All 10 iterations PASSED. ✓
No stack corruption detected.

=== BACK-TO-BACK CMP TEST ===
Result 1: $4040 PASS (GT) ✓
Result 2: $8080 PASS (LT) ✓
Result 3: $0002 PASS (EQ) ✓
```

**Pass Criteria:**
- Stack depth correct after operations
- Repeated operations don't corrupt state
- Back-to-back cmp() calls work correctly

---

## Test Results Template

### Test Execution Record

**Date:** _______________
**Tester:** _______________
**Build:** _______________

| Phase | Test | Status | Notes |
|-------|------|--------|-------|
| 1 | Baseline fptest_mf | ☐ PASS ☐ FAIL | |
| 1 | Baseline mandel_mf | ☐ PASS ☐ FAIL | |
| 4.1 | sub() isolated | ☐ PASS ☐ FAIL | |
| 4.2 | cmp() isolated | ☐ PASS ☐ FAIL | |
| 4.3 | Interleaved ops | ☐ PASS ☐ FAIL | |
| 5.1 | fptest_mf (post-fix) | ☐ PASS ☐ FAIL | |
| 5.2 | mandel_mf (post-fix) | ☐ PASS ☐ FAIL | |
| 6.1 | Edge cases | ☐ PASS ☐ FAIL | |
| 6.2 | Stack validation | ☐ PASS ☐ FAIL | |

**Overall Result:** ☐ ALL PASS (Ready for commit) ☐ FAILURES (Need debug)

### Bug Report Template (if failures occur)

**Bug ID:** _______________
**Severity:** ☐ CRITICAL ☐ HIGH ☐ MEDIUM ☐ LOW
**Test:** _______________

**Observed Behavior:**


**Expected Behavior:**


**Steps to Reproduce:**
1.
2.
3.

**Stack Trace / Output:**


**Analysis:**


**Recommended Fix:**


---

## Success Criteria Summary

### MUST HAVE (Critical - No Compromise)

✅ **ALL Phase 4 tests PASS** (isolated sub/cmp tests)
✅ **ALL Phase 5.1 tests PASS** (fptest_mf full suite)
✅ **Phase 5.2 completes without crash** (mandel_mf)
✅ **NO regression in 11 working operations**

### SHOULD HAVE (Important - Expected)

✅ **Phase 6.1 edge cases PASS** (boundary conditions)
✅ **Phase 6.2 stack validation PASS** (no corruption)
✅ **Mandelbrot renders correctly** (visual check)

### NICE TO HAVE (Optional - Bonus)

✅ Performance same or better than baseline
✅ Clean exit from all tests
✅ No memory leaks over extended use

---

## Failure Response Plan

### If Unit Tests Fail (Phase 4)

**Action:** STOP immediately, do NOT proceed to integration testing.

**Debug Steps:**
1. Check if sub() alone still works
2. Check if cmp() logic is correct (use test_cmp_direct.pla)
3. Review changes to fpumf.pla (diff against backup)
4. Check for typos in code
5. Verify compilation succeeded
6. Re-read RISK_ASSESSMENT_CMP_FIX.md hypotheses

**Options:**
- Try different fix approach (Option A vs Option B)
- Add diagnostic output to trace execution
- Revert and re-analyze problem

### If Integration Tests Fail (Phase 5)

**Action:** Assess severity.

**If fptest_mf has NEW failures:**
- CRITICAL: Revert immediately
- Debug: Identify which operation broke
- Compare before/after behavior

**If only mandel_mf fails:**
- MEDIUM: May be application-specific issue
- Debug: Check if Mandelbrot's use of cmp() is different
- May need targeted fix

### If Edge Cases Fail (Phase 6)

**Action:** Assess if fix is incomplete.

**Debug:**
- Identify which edge case fails
- Check if it's a precision issue or logic bug
- May need additional handling for edge cases

---

## Post-Test Deliverables

1. **TEST_RESULTS.txt** - Complete test execution record
2. **SCREENSHOTS/** - Visual confirmation of Mandelbrot rendering
3. **BUG_REPORTS/** - Any issues found (if applicable)
4. **UPDATED_VERIFICATION_REPORT.md** - Include cmp() fix in verification doc

---

## Approval Checklist

Before marking fix as complete:

☐ All critical tests PASS
☐ No regression in existing operations
☐ Test results documented
☐ Code reviewed for quality
☐ Comments updated in source
☐ Git commit prepared with clear message
☐ Disk image rebuilt and tested

**Approved by:** _______________
**Date:** _______________

---

**END OF TEST PLAN**
