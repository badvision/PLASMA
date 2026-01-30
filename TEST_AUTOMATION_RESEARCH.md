# Test Automation Research: Best Practices for PLASMA/MegaFlash FPU Testing

**Researcher:** Sofia (Idealistic Analyst)
**Date:** January 29, 2026
**Project:** PLASMA/PLEIADES MegaFlash FPU Testing
**Scope:** Research test automation patterns for Apple II emulator-based testing

---

## Executive Summary

This research explores **best-in-class test automation** approaches for validating FPU operations in the PLASMA/MegaFlash environment. After analyzing emulator capabilities, existing test infrastructure, and modern testing practices, I present both **pragmatic immediate solutions** and **visionary long-term architecture** for world-class quality assurance.

**Key Finding:** We have an exceptional foundation for automated testing that most retro computing projects would envy. JACE's HeadlessTerminal provides scriptable, console-driven automation superior to many commercial emulators.

---

## 1. Current State Analysis

### What We Have (The Good News)

1. **JACE Emulator with HeadlessTerminal**
   - Full command-line automation via `jace.terminal.HeadlessTerminal`
   - Scriptable via stdin/stdout (can pipe commands!)
   - Can insert disk images programmatically: `insertdisk d1 <path>`
   - Can run CPU cycles: `run <cycles>`
   - Can monitor memory and set breakpoints
   - Can simulate keypresses: `key <string>`
   - **This is GOLD** - most Apple II emulators don't have this

2. **Build System Integration**
   - Makefile already compiles all modules
   - `build_disk.sh` creates bootable disk images
   - Repeatable build process with dependencies

3. **Test Programs Already Written**
   - `fptest_mf.pla` - Comprehensive FPU test suite
   - `test_cmp_*.pla` - Specific comparison tests
   - Multiple diagnostic programs in `samplesrc/`

4. **MegaFlash FPU Hardware**
   - JACE supports MegaFlash card emulation
   - Real hardware available for validation

### What's Missing (The Opportunity)

1. **Automated Test Runner**
   - No script to launch JACE, boot disk, run tests, capture output
   - Manual testing is slow and error-prone
   - No CI/CD integration

2. **Output Validation**
   - Tests print results but no automated pass/fail detection
   - Requires human to read console output
   - No structured test reporting (JUnit XML, TAP, etc.)

3. **Test Orchestration**
   - No test discovery mechanism
   - No test suite organization
   - No parallel test execution

4. **Regression Testing**
   - No baseline capture/comparison
   - No performance benchmarking
   - No visual regression (screenshot diffs)

---

## 2. Test Automation Architecture: The Vision

### Tier 1: Immediate Win (MVP - This Week)

**Goal:** Automated smoke test that validates FPU operations in <5 minutes

**Components:**

```
test_runner.sh
├── Build PLASMA programs (make clean && make)
├── Build disk image (build_disk.sh)
├── Launch JACE in headless mode
├── Insert disk image
├── Boot ProDOS (simulate keystrokes)
├── Run fptest_mf.pla
├── Capture console output
├── Parse output for PASS/FAIL
└── Exit with 0 (success) or 1 (failure)
```

**Implementation:**
```bash
#!/bin/bash
# test_runner.sh - Basic automated test execution

set -e
OUTPUT_LOG="test_results_$(date +%Y%m%d_%H%M%S).log"

# Build everything
cd src && make clean && make && cd ..
bash build_disk.sh

# Run tests via JACE headless
{
    echo "insertdisk d1 $PWD/PLEIADES-MEGAFLASH-FPU.po"
    sleep 2
    echo "key \"-/SYS/FPTEST_MF\\n\""  # Type command + Enter
    sleep 10  # Let test run
    echo "qq"  # Exit
} | mvn -q exec:java \
    -Dexec.mainClass="jace.terminal.HeadlessTerminal" \
    -f /Users/brobert/Documents/code/jace/pom.xml \
    2>&1 | tee "$OUTPUT_LOG"

# Validate results
if grep -q "All tests PASSED" "$OUTPUT_LOG"; then
    echo "✅ TEST SUITE PASSED"
    exit 0
else
    echo "❌ TEST SUITE FAILED"
    grep -i "fail\|error" "$OUTPUT_LOG"
    exit 1
fi
```

**Benefits:**
- Runs entire test suite in under 5 minutes
- Detects regressions immediately
- Can be run by any developer
- Ready for CI/CD integration

### Tier 2: Professional (Next Sprint)

**Goal:** Comprehensive test harness with structured reporting

**Components:**

1. **Test Discovery & Organization**
   ```
   tests/
   ├── unit/           # Individual operation tests
   │   ├── test_add.pla
   │   ├── test_sub.pla
   │   ├── test_cmp.pla
   │   └── ...
   ├── integration/    # Multi-operation tests
   │   ├── mandel_test.pla
   │   └── rpncalc_test.pla
   ├── stress/         # Performance tests
   │   └── fpu_bench.pla
   └── regression/     # Known-issue validation
       └── cmp_fix_validation.pla
   ```

2. **Structured Test Output**
   - Tests write TAP (Test Anything Protocol) format
   - Parseable by standard tools (prove, Jenkins, GitLab CI)

   Example test output:
   ```
   TAP version 13
   1..12
   ok 1 - add(3.14, 2.71) = 5.85
   ok 2 - sub(10.0, 3.0) = 7.0
   not ok 3 - cmp(10.0, 5.0) returns GT
   # Expected: $4040
   # Got: $8080
   ok 4 - mul(2.0, 3.14) = 6.28
   ...
   ```

3. **Test Runner Framework**
   ```python
   # runner.py - Sophisticated test orchestration
   import subprocess
   import json
   from dataclasses import dataclass

   @dataclass
   class TestResult:
       name: str
       passed: bool
       duration: float
       output: str

   class JACETestRunner:
       def run_test_suite(self, tests):
           results = []
           for test in tests:
               result = self.run_single_test(test)
               results.append(result)
           return self.generate_report(results)

       def run_single_test(self, test_path):
           # Launch JACE, run test, capture output
           # Parse TAP output
           # Return structured result
           pass
   ```

4. **Baseline Comparison**
   ```bash
   # Capture baseline
   ./test_runner.sh --capture-baseline baseline_v1.json

   # Compare after changes
   ./test_runner.sh --compare baseline_v1.json
   # Shows: 3 tests now failing, 2 tests improved performance
   ```

**Benefits:**
- Parallel test execution (run tests concurrently)
- Clear pass/fail metrics
- Performance regression detection
- Easy CI/CD integration
- Bisect-friendly (find breaking commit)

### Tier 3: World-Class (Aspirational)

**Goal:** Zero-friction, production-grade test infrastructure

**Components:**

1. **Test Fixtures & Mocking**
   ```plasma
   // Mock FPU for unit testing without hardware
   module FPUMock
       def pushStr(str)#1
           // Simulate MegaFlash response
       end

       def cmp()#1
           // Return known values for testing
           return FPUCMPGT
       end
   end

   // Use in tests:
   import "FPUMock" as fpumf
   // Test comparison logic without hardware
   ```

2. **Visual Regression Testing**
   ```bash
   # Capture screenshots of Mandelbrot rendering
   jace_screenshot_diff \
       --baseline screenshots/mandel_baseline.png \
       --test screenshots/mandel_current.png \
       --threshold 0.01  # 1% pixel difference allowed
   ```

3. **Performance Profiling**
   ```bash
   # Benchmark FPU operations
   ./bench_runner.sh --profile
   # Outputs:
   # add(): 123 cycles avg (baseline: 120, +2.5%)
   # mul(): 456 cycles avg (baseline: 450, +1.3%)
   # cmp(): 89 cycles avg (baseline: 150, -40.7% ⚡ IMPROVED!)
   ```

4. **Continuous Integration**
   ```yaml
   # .github/workflows/test.yml
   name: FPU Tests
   on: [push, pull_request]
   jobs:
     test:
       runs-on: macos-latest
       steps:
         - uses: actions/checkout@v3
         - name: Build PLASMA
           run: cd src && make
         - name: Run Test Suite
           run: ./test_runner.sh --junit-xml results.xml
         - name: Publish Results
           uses: EnricoMi/publish-unit-test-result-action@v2
           with:
             files: results.xml
   ```

5. **Mutation Testing**
   ```bash
   # Inject bugs, verify tests catch them
   mutation_tester \
       --target src/libsrc/fpumf.pla \
       --mutate operators  # Change + to -, & to |, etc.
       --verify tests/unit/
   # Result: 95% of mutations detected (good coverage!)
   ```

6. **Fuzz Testing**
   ```python
   # Generate random FPU inputs, look for crashes
   import random
   for i in range(10000):
       a = random.uniform(-1e308, 1e308)
       b = random.uniform(-1e308, 1e308)
       test_fpu_operation("add", a, b)
       test_fpu_operation("cmp", a, b)
   # Found 0 crashes after 10,000 iterations
   ```

**Benefits:**
- Automated PR validation (can't merge if tests fail)
- Performance tracking over time
- Catch regressions before they ship
- High confidence in code changes
- Industry-standard practices

---

## 3. Comparison: How Other Emulators Handle Testing

### MAME (Gold Standard)

**Approach:** Functional validation through actual usage
- Focus: "Does the software run correctly?"
- Method: Extensive ROM/software library testing
- Challenge: Requires large test ROM collection
- Benefit: Validates end-to-end system behavior

**Lessons for PLASMA:**
- Real-world software (like Mandelbrot) is the best test
- Keep a "golden master" disk that exercises all features
- If user applications work, emulation is correct

### AppleWin

**Approach:** No documented automation (relies on manual testing)
- Developers test changes manually
- Community reports bugs
- Regression testing is ad-hoc

**Lesson:** Don't follow this model - we can do better!

### JACE (Our Emulator)

**Approach:** HeadlessTerminal for scriptable testing
- **Exceptional** for emulator debugging
- Terminal mode allows inspection and manipulation
- Used heavily during JACE development

**Our Advantage:** We already have the best tool available!

### Embedded Systems Testing (Parallel Domain)

Many patterns apply from embedded systems:
- **Hardware-in-the-loop (HIL):** Run tests on real MegaFlash card
- **Continuous integration:** Automated builds and tests
- **Test fixtures:** Known-good hardware configurations
- **Regression suites:** Prevent old bugs from returning

**Opportunity:** PLASMA could be industry-leading in retro computing QA

---

## 4. Proposed Test Infrastructure: Technical Details

### 4.1. Test Runner Script Design

**Architecture:**
```
test_runner.sh
├── parse_args()          # Handle --verbose, --filter, etc.
├── build_project()       # make clean && make
├── build_disk()          # Create bootable image
├── launch_emulator()     # Start JACE headless
├── execute_tests()       # Run test programs
├── capture_output()      # Log all console output
├── parse_results()       # Extract pass/fail
└── generate_report()     # JUnit XML, HTML report
```

**Key Features:**
- **Timeout handling:** Kill tests that hang
- **Retry logic:** Re-run flaky tests
- **Parallel execution:** Run independent tests simultaneously
- **Signal handling:** Clean shutdown on Ctrl+C
- **Detailed logging:** Debug mode with full emulator output

### 4.2. Test Program Standards

**Every test should:**
1. Print clear PASS/FAIL for each assertion
2. Exit with specific return codes (0=pass, 1=fail)
3. Write output in parseable format (TAP or JUnit)
4. Complete within reasonable time (< 30 seconds)
5. Be independent (no shared state between tests)

**Example test structure:**
```plasma
// test_fpu_add.pla
include "inc/cmdsys.plh"
include "inc/fpumf.plh"

def test_add_positive()#1
    fpumf:pushStr("3.14")
    fpumf:pushStr("2.71")
    fpumf:add()
    // Validate result ~= 5.85
    // Return 0 if pass, 1 if fail
end

def main#0
    word failures = 0

    puts("TAP version 13\n")
    puts("1..5\n")  // 5 tests

    if test_add_positive()
        failures++
        puts("not ok 1 - add positive numbers\n")
    else
        puts("ok 1 - add positive numbers\n")
    fin

    // ... more tests ...

    if failures
        exit(1)  // Fail
    fin
    exit(0)  // Success
end
```

### 4.3. Output Validation Strategies

**Strategy 1: String Matching**
```bash
# Simple but fragile
if grep -q "PASS" output.log; then
    echo "Test passed"
fi
```

**Strategy 2: Structured Output (TAP)**
```bash
# Robust and standard
prove --exec ./test_runner.sh tests/*.pla
```

**Strategy 3: Exit Codes**
```bash
# Most reliable
if ./run_test.sh fptest_mf.pla; then
    echo "Test suite passed"
else
    echo "Test suite failed" >&2
    exit 1
fi
```

**Strategy 4: API Validation (Advanced)**
```python
# For complex scenarios
results = JACERunner().run_test("fptest_mf.pla")
assert results.test_count == 12
assert results.passed == 12
assert results.failed == 0
```

### 4.4. CI/CD Integration

**GitHub Actions Example:**
```yaml
name: PLASMA FPU Tests

on:
  push:
    branches: [ main, megaflash-fpu-support ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: macos-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Install dependencies
      run: |
        brew install acme openjdk maven

    - name: Build PLASMA
      run: cd src && make

    - name: Build disk image
      run: bash build_disk.sh

    - name: Run FPU test suite
      run: bash test_runner.sh --junit-xml results.xml

    - name: Publish test results
      uses: EnricoMi/publish-unit-test-result-action@v2
      if: always()
      with:
        files: results.xml

    - name: Upload disk image artifact
      uses: actions/upload-artifact@v3
      if: always()
      with:
        name: test-disk-image
        path: PLEIADES-MEGAFLASH-FPU.po
```

**Benefits:**
- Every commit is tested automatically
- Pull requests show test status
- Failed tests block merging
- Artifacts preserved for debugging

---

## 5. Advanced Testing Strategies

### 5.1. Property-Based Testing

**Concept:** Instead of testing specific inputs, test properties that should always hold

**Example:**
```python
# Property: add() is commutative
for i in range(1000):
    a, b = random.random(), random.random()
    result1 = fpu_add(a, b)
    result2 = fpu_add(b, a)
    assert result1 == result2, "Addition should be commutative"

# Property: cmp() is anti-symmetric
for i in range(1000):
    a, b = random.random(), random.random()
    if fpu_cmp(a, b) == GT:
        assert fpu_cmp(b, a) == LT
```

**Tools:** Hypothesis (Python), QuickCheck (Haskell), fast-check (JavaScript)

### 5.2. Golden Master Testing

**Concept:** Capture known-good output, compare against future runs

**Implementation:**
```bash
# Capture golden master (once)
./test_runner.sh --capture-golden golden_output.txt

# Compare future runs
./test_runner.sh --compare-golden golden_output.txt
# Reports any differences in output
```

**Benefits:**
- Catches unexpected changes
- Great for regression testing
- Easy to understand (diff output)

### 5.3. Metamorphic Testing

**Concept:** If we transform input in a known way, output should transform predictably

**Example:**
```python
# If we add X to both operands, result should increase by X
result1 = fpu_add(a, b)
result2 = fpu_add(a+x, b+x)
assert result2 - result1 == x
```

### 5.4. Chaos Engineering

**Concept:** Inject failures, verify system remains stable

**Example:**
```bash
# Test with simulated MegaFlash failure
JACE_MEGAFLASH_FAIL_RATE=0.1 ./test_runner.sh
# Should fallback to SANE gracefully
```

---

## 6. Test Organization & Best Practices

### 6.1. Test Pyramid

```
         ╱╲
        ╱  ╲       E2E Tests (few)
       ╱────╲      - Full Mandelbrot render
      ╱      ╲     - RPNCALC with user input
     ╱────────╲
    ╱          ╲   Integration Tests (some)
   ╱────────────╲  - Multi-operation sequences
  ╱              ╲ - Library interactions
 ╱────────────────╲
╱                  ╲ Unit Tests (many)
────────────────────  - Individual FPU operations
                      - Comparison logic
                      - Stack management
```

**Guideline:**
- 70% unit tests (fast, focused)
- 20% integration tests (realistic scenarios)
- 10% end-to-end tests (full user workflows)

### 6.2. Test Naming Convention

```
test_<component>_<scenario>_<expected>

Examples:
- test_cmp_positive_numbers_returns_gt
- test_sub_equal_values_returns_zero
- test_mandel_escape_detection_works
```

### 6.3. Test Independence

**Golden Rule:** Each test should run in isolation

**Anti-pattern:**
```plasma
// BAD: Tests depend on order
def test1()
    fpumf:pushStr("3.14")  // Leaves value on stack
end

def test2()
    fpumf:add()  // Expects value from test1 ❌
end
```

**Correct:**
```plasma
// GOOD: Each test is self-contained
def test1()
    fpumf:reset()  // Clean state
    fpumf:pushStr("3.14")
    // ... test logic ...
    fpumf:reset()  // Clean up
end
```

### 6.4. Flaky Test Management

**Strategy:** Tests should be deterministic

**If a test is flaky:**
1. **Diagnose:** Add logging to understand why
2. **Fix:** Address root cause (timing, race conditions)
3. **Quarantine:** If unfixable, mark as known-flaky
4. **Track:** Keep metrics on flakiness rate

**Tools:**
```bash
# Run test 100 times to detect flakiness
for i in {1..100}; do
    ./test_runner.sh test_cmp.pla || echo "Failed on run $i"
done
```

---

## 7. Performance Testing & Benchmarking

### 7.1. Cycle-Accurate Benchmarks

**Goal:** Track performance over time

```plasma
// bench_fpu_ops.pla
def benchmark_add(iterations)
    word i
    word start_cycles

    start_cycles = get_cycle_count()

    for i = 1 to iterations
        fpumf:pushStr("3.14")
        fpumf:pushStr("2.71")
        fpumf:add()
        fpumf:drop()
    next

    return (get_cycle_count() - start_cycles) / iterations
end

def main()
    puts("Benchmarking FPU operations...\n")
    printf("add: %d cycles\n", benchmark_add(1000))
    printf("mul: %d cycles\n", benchmark_mul(1000))
    printf("cmp: %d cycles\n", benchmark_cmp(1000))
end
```

### 7.2. Performance Regression Detection

```bash
# Capture baseline
./bench_runner.sh > baseline_perf.json

# After code changes
./bench_runner.sh > current_perf.json

# Compare
perf_compare baseline_perf.json current_perf.json
# Output:
# add: 120 → 123 cycles (+2.5%) ⚠️
# mul: 450 → 450 cycles (no change) ✓
# cmp: 150 → 89 cycles (-40.7%) ⚡ IMPROVED!
```

### 7.3. Load Testing

**Scenario:** Stress test with heavy computation

```plasma
// stress_test_mandel.pla
// Render Mandelbrot at maximum iterations
def stress_test()
    word max_iter = 1000  // Very high
    // Render full screen at high precision
    // This exercises ALL FPU operations heavily
end
```

**Validation:**
- No crashes after 1 hour runtime
- Memory usage stable
- No stack overflow
- Consistent performance (no degradation)

---

## 8. Real-World Integration Testing

### 8.1. Application-Level Tests

**Philosophy:** If applications work, FPU is correct

**Test Suite:**
1. **Mandelbrot Renderer**
   - Renders known coordinates
   - Compare against reference image
   - Validates: cmp(), sub(), mul(), add()

2. **RPN Calculator**
   - Compute complex expression: `3.14 2.71 + 5 * sqrt`
   - Verify result matches reference
   - Validates: All operations + stack management

3. **Scientific Calculator**
   - Trigonometric functions
   - Logarithms and exponentials
   - Statistical functions

**Example:**
```bash
# test_mandel_render.sh
EXPECTED_HASH="a3f5b8c2d1e9..."
ACTUAL_HASH=$(jace_render_mandel | sha256sum)

if [ "$EXPECTED_HASH" = "$ACTUAL_HASH" ]; then
    echo "Mandelbrot render: PASS"
else
    echo "Mandelbrot render: FAIL (pixels differ)"
    exit 1
fi
```

### 8.2. Hardware Validation

**Goal:** Verify emulator matches real MegaFlash hardware

**Process:**
1. Run test suite on real Apple IIe with MegaFlash
2. Capture serial output or screenshots
3. Run same tests in JACE emulator
4. Compare outputs byte-for-byte

**Script:**
```bash
# test_hardware_equivalence.sh
./run_on_real_hardware.sh > hardware_output.log
./run_in_emulator.sh > emulator_output.log

if diff hardware_output.log emulator_output.log; then
    echo "✅ Emulator matches hardware perfectly"
else
    echo "❌ Emulator differs from hardware"
    diff -u hardware_output.log emulator_output.log
fi
```

---

## 9. Recommended Immediate Action Plan

### Week 1: Foundation
- [ ] Create `test_runner.sh` (basic version)
- [ ] Test with existing `fptest_mf.pla`
- [ ] Verify can detect pass/fail
- [ ] Document usage in README

### Week 2: Structure
- [ ] Organize tests into directories (unit/integration/e2e)
- [ ] Add TAP output to test programs
- [ ] Create test result parser
- [ ] Add timeout handling

### Week 3: Integration
- [ ] Set up GitHub Actions workflow
- [ ] Add baseline comparison
- [ ] Create test report generation
- [ ] Document CI/CD process

### Week 4: Polish
- [ ] Add performance benchmarking
- [ ] Create test coverage analysis
- [ ] Write developer testing guide
- [ ] Set up automated PR testing

---

## 10. Long-Term Vision: Industry Leadership

**Goal:** Make PLASMA/PLEIADES the gold standard for retro computing quality

**Aspirations:**

1. **Zero-Regression Policy**
   - No commit breaks existing tests
   - Performance never degrades without reason
   - Every bug fix includes regression test

2. **Test-Driven Development**
   - Write tests before fixing bugs
   - Red-green-refactor cycle
   - High test coverage (>80%)

3. **Continuous Validation**
   - Tests run on every commit
   - Nightly full test suite
   - Weekly hardware validation

4. **Public Test Dashboard**
   - Live test results visible on GitHub
   - Performance trends over time
   - Test coverage metrics

5. **Community Contributions**
   - Easy for contributors to run tests
   - Clear test expectations
   - Test failures block merges

**Impact:**
- Faster development (catch bugs early)
- Higher quality (fewer bugs reach users)
- More contributors (confidence in changes)
- Better documentation (tests as examples)

---

## 11. Tools & Technologies Recommendation

### Essential (Use Now)
- **JACE HeadlessTerminal** - Our secret weapon
- **Bash scripts** - Simple, portable, effective
- **Make** - Already integrated
- **Git** - Version control

### Professional (Add Next)
- **Python** - Test runner framework
- **TAP** - Test output format
- **JUnit XML** - CI/CD reporting
- **GitHub Actions** - Free CI/CD

### Advanced (Long-Term)
- **pytest** - Python testing framework
- **Robot Framework** - Keyword-driven testing
- **Hypothesis** - Property-based testing
- **Jenkins** - Self-hosted CI/CD
- **Grafana** - Performance dashboards

---

## 12. Success Metrics

**Immediate (Week 1):**
- ✅ Can run full test suite with one command
- ✅ Results show pass/fail clearly
- ✅ Takes less than 5 minutes

**Short-Term (Month 1):**
- ✅ Tests run on every PR automatically
- ✅ >50 test cases covering all FPU operations
- ✅ Zero false positives (flaky tests)

**Long-Term (Quarter 1):**
- ✅ >80% code coverage
- ✅ Performance benchmarks tracked
- ✅ Hardware validation automated
- ✅ Contributors run tests before submitting PRs

---

## 13. Risk Assessment

### Low Risk
- **Basic test runner** - Straightforward bash scripting
- **Exit code validation** - Simple and reliable
- **Manual smoke tests** - Already doing this

### Medium Risk
- **TAP output parsing** - Need to handle format variations
- **Timing issues** - Emulator speed varies
- **Disk image corruption** - Need checksums

### High Risk
- **Hardware validation** - Requires physical hardware access
- **Visual regression** - Screenshot comparison tricky
- **Parallel testing** - Race conditions possible

**Mitigation:** Start simple, add complexity incrementally

---

## 14. Comparative Analysis: Other Platforms

### Modern Software (for inspiration)
- **Kubernetes:** Uses extensive integration tests with real clusters
- **PostgreSQL:** 10,000+ regression tests, property-based testing
- **Linux Kernel:** KUnit framework, continuous testing

### Retro Computing (peers)
- **C64 Forever:** Automated regression testing of emulator
- **DOSBox:** Community-contributed test cases
- **ScummVM:** Game-specific test suites

**Lesson:** Even retro projects benefit from modern testing practices

---

## 15. Conclusion: The Path Forward

We are in an **exceptionally strong position** to implement world-class test automation:

✅ **We have the tools:** JACE HeadlessTerminal is outstanding
✅ **We have the tests:** fptest_mf.pla and others are well-written
✅ **We have the build system:** Make + build_disk.sh is solid
✅ **We have the hardware:** MegaFlash FPU is well-understood

**What we need:** Glue code to tie it all together.

**My recommendation:** Start with the **Tier 1 (MVP)** approach this week:
1. Create `test_runner.sh` that boots disk and runs fptest_mf.pla
2. Validate it catches the cmp() bug (should fail before fix, pass after)
3. Add to README so anyone can run tests
4. Iterate from there

**This is achievable in a few hours of work and will pay dividends immediately.**

Once we have basic automation working, we can incrementally add:
- More tests (Tier 2)
- CI/CD integration (Tier 2)
- Performance tracking (Tier 3)
- Advanced features (Tier 3)

**The best test infrastructure is the one that gets used.** Start simple, prove value, then expand.

---

## Appendix A: Example Test Runner (MVP)

```bash
#!/bin/bash
# test_runner.sh - Minimal Viable Product
# Usage: ./test_runner.sh

set -e  # Exit on error

JACE_DIR="/Users/brobert/Documents/code/jace"
PLASMA_DIR="/Users/brobert/Documents/code/PLASMA"
DISK_IMAGE="$PLASMA_DIR/PLEIADES-MEGAFLASH-FPU.po"
LOG_FILE="test_results_$(date +%Y%m%d_%H%M%S).log"

echo "=== PLASMA FPU Test Runner ==="
echo "Building project..."

# Build PLASMA
cd "$PLASMA_DIR/src"
make clean
make

# Build disk image
cd "$PLASMA_DIR"
bash build_disk.sh

echo "Running tests in JACE emulator..."

# Create test script for JACE
cat > /tmp/jace_test_script.txt <<EOF
insertdisk d1 $DISK_IMAGE
key "\n"
sleep 3
key "-/SYS/FPTEST_MF\n"
sleep 15
key "\n"
qq
EOF

# Run JACE with test script
cd "$JACE_DIR"
cat /tmp/jace_test_script.txt | \
    mvn -q exec:java \
    -Dexec.mainClass="jace.terminal.HeadlessTerminal" \
    2>&1 | tee "$PLASMA_DIR/$LOG_FILE"

# Analyze results
echo ""
echo "=== Test Results ==="

if grep -q "All tests PASSED" "$PLASMA_DIR/$LOG_FILE"; then
    echo "✅ TEST SUITE PASSED"
    exit 0
elif grep -q "FAIL\|Error" "$PLASMA_DIR/$LOG_FILE"; then
    echo "❌ TEST SUITE FAILED"
    echo "Failed tests:"
    grep -i "fail\|error" "$PLASMA_DIR/$LOG_FILE" | head -10
    exit 1
else
    echo "⚠️  UNCERTAIN (could not parse results)"
    echo "Check log: $LOG_FILE"
    exit 2
fi
```

**Next Steps:**
1. Save this as `test_runner.sh`
2. Make executable: `chmod +x test_runner.sh`
3. Run: `./test_runner.sh`
4. Iterate based on results

---

## Appendix B: Resources & References

### Emulator Testing
- MAME Testing Framework: https://github.com/mamedev/mame/tree/master/src/devices/bus
- AppleWin on GitHub: https://github.com/AppleWin/AppleWin
- JACE Terminal Documentation: (in source code)

### Test Automation Best Practices
- Test Pyramid: https://martinfowler.com/articles/practical-test-pyramid.html
- TAP Protocol: https://testanything.org/
- CI/CD for C/Assembly: https://interrupt.memfault.com/blog/unit-test-mocking

### Property-Based Testing
- Hypothesis (Python): https://hypothesis.readthedocs.io/
- QuickCheck (Haskell): https://hackage.haskell.org/package/QuickCheck

### Retro Computing Testing
- C64 Emulator Testing: https://vice-emu.sourceforge.io/
- DOSBox Test Suite: https://www.dosbox.com/wiki/
- ScummVM Testing: https://wiki.scummvm.org/index.php/Testing

---

**End of Research Document**

*This represents an idealistic vision of what's possible. Start with MVP, prove value, then expand based on needs and resources.*
