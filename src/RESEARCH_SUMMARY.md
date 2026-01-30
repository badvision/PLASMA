# PLASMA Assembly Function Research - Executive Summary

## Research Completed

Comprehensive analysis of PLASMA documentation, VM implementation, and complex library examples (DHGR, int32) to understand proper assembly function conventions and identify issues in `fpumf.pla`.

## Key Discovery: Fundamental Misconception About ESP

### The Core Problem

**fpumf.pla treats ESP as if it's a constant or the stack pointer itself. It's neither.**

```asm
// MISCONCEPTION (what fpumf.pla assumes):
LDX     #ESP        // "Load stack pointer into X"
STX     ESP         // "Save stack pointer"

// REALITY:
ESP     =   $E5     // ESP is a VARIABLE at address $E5
                    // It STORES the stack pointer value
                    // X IS the stack pointer (set by VM)
                    // You should NEVER manually set X from ESP
```

### PLASMA Evaluation Stack Architecture

From `vmsrc/apple/plvmzp.inc` and `doc/PLASMA.md`:

```
Memory Layout:
  $A0-$BF : ESTKH (stack high bytes, 32 bytes)
  $C0-$DF : ESTKL (stack low bytes, 32 bytes)
  $E5     : ESP (variable storing current X value)

Stack Structure:
  - 32 words (64 bytes) split into high/low sections
  - X register = current top of stack (0-31)
  - ESTKH,X = high byte of stack entry
  - ESTKL,X = low byte of stack entry
  - Stack grows DOWN (push=DEX, pop=INX)
```

### From PLASMA Documentation

**doc/PLASMA.md line 1277:**
> "The 6502's X register is used to index into the evaluation stack. It *always* points to the top of the evaluation stack, so care must be taken to save and restore its value when calling native 6502 code."

**Key insight:** X *always* points to the stack top. The VM maintains this. Your assembly function receives X already set correctly.

## Critical Bug in fpumf.pla

### Current sendFACARG Code (WRONG)

```asm
asm sendFACARG(pFAC, pARG, facExt)#0
    // X already contains ESP from VM  <- WRONG TERMINOLOGY

    LDA     ESTKL+2,X       // pFAC low  <- FORWARD ACCESS (DANGEROUS!)
    STA     $06
    LDA     ESTKH+2,X       // pFAC high <- FORWARD ACCESS
    STA     $07

    LDA     ESTKL+1,X       // pARG low  <- FORWARD ACCESS
    STA     $08
    LDA     ESTKH+1,X       // pARG high <- FORWARD ACCESS
    STA     $09

    LDA     ESTKL,X         // facExt
    STA     $0A

    INX                     // Pop parameters
    INX
    INX
    // Missing: STX ESP
```

### Problems

1. **Forward indexing** (`+2`, `+1`) goes BEYOND stack bounds
2. With X=$1C (after 3 pushes), `ESTKL+2,X` = `$C0 + $1E` = `$DE` (edge case)
3. `ESTKL+4,X` would be `$E0` = **IFP corruption!**
4. Missing `STX ESP` after popping
5. Wrong conceptual model in comments

### Memory Corruption Risk

```
Stack bounds: $C0-$DF (ESTKL)
With X=$1C (after 3 pushes):
  ESTKL+0,X = $DC (valid - facExt)
  ESTKL+1,X = $DD (valid - pARG)
  ESTKL+2,X = $DE (edge - pFAC)
  ESTKL+3,X = $DF (last stack byte)
  ESTKL+4,X = $E0 (IFP - CORRUPTION!)
  ESTKL+5,X = $E1 (IFP+1 - CORRUPTION!)
  ...
  ESTKL+37,X = $E5 (ESP - CATASTROPHIC!)
```

## Correct Pattern from DHGR Library

### Working Example from dhgrlib.pla line 444

```asm
asm dcgrPlotScr(x, y)#0
    INX                 // Pop first parameter
    INX                 // Pop second parameter
    STX     ESP         // Save stack pointer
    LDY     ESTKL-2,X   // Y COORD (2nd param, 2 back from new position)
    CPY     #192
    BCS     RETPLTS
    ...
    LDY     ESTKL-1,X   // X COORD (1st param, 1 back from new position)
    ...
end
```

**Pattern:**
1. Pop parameters FIRST (INX for each param)
2. Save stack pointer with `STX ESP`
3. Access parameters BACKWARDS using negative offsets
4. Return with X already adjusted

## Corrected sendFACARG Implementation

```asm
asm sendFACARG(pFAC, pARG, facExt)#0
    !SOURCE "vmsrc/apple/plvmzp.inc"
    !SOURCE "vmsrc/apple/megaflash.inc"

    // X points to top of stack (facExt parameter)
    // Stack layout: [pFAC+2] [pARG+1] [facExt] <- X

    // Pop all 3 parameters first
    INX                     // Move past facExt
    INX                     // Move past pARG
    INX                     // Move past pFAC
    STX     ESP             // Update stack pointer variable

    // Access parameters backwards from new position
    LDA     ESTKL-3,X       // facExt (3 positions back)
    STA     $0A

    LDA     ESTKL-2,X       // pARG low (2 back)
    STA     $08
    LDA     ESTKH-2,X       // pARG high
    STA     $09

    LDA     ESTKL-1,X       // pFAC low (1 back)
    STA     $06
    LDA     ESTKH-1,X       // pFAC high
    STA     $07

    // Reset buffer pointer
    STZ     MF_CMDREG

    // Send FAC and ARG (interleaved)
    LDY     #5
-   LDA     ($06),Y         // FAC[Y]
    STA     MF_PARAMREG
    LDA     ($08),Y         // ARG[Y]
    STA     MF_PARAMREG
    DEY
    BPL     -

    // Send facExt
    LDA     $0A
    STA     MF_PARAMREG

    RTS
end
```

**Why this works:**
- Pop first moves X to safe position ($1C → $1F)
- Backward indexing (`-3`, `-2`, `-1`) accesses valid stack memory
- All accesses within stack bounds
- Follows established DHGR pattern

## Functions Requiring Fixes

### Critical: sendFACARG (line 267)
- **Status:** MUST FIX
- **Issue:** Forward indexing, memory corruption risk
- **Fix:** Complete rewrite as shown above

### Minor: execMegaFlash (line 152)
- **Status:** Comment improvements
- **Issue:** Misleading ESP terminology
- **Fix:** Update comments to clarify X vs ESP

### OK: waitMegaFlash (line 118)
- **Status:** No changes needed
- **Reason:** No stack parameters

### OK: receiveFAC (line 369)
- **Status:** Optional comment improvement
- **Reason:** Already uses correct pattern

## Documentation Provided

1. **PLASMA_ASM_FUNCTION_RESEARCH.md**
   - Comprehensive research findings
   - Complete memory layout analysis
   - Detailed explanation of stack architecture
   - Multiple examples from working code

2. **FPUMF_FIX_GUIDE.md**
   - Side-by-side before/after comparisons
   - Quick reference patterns
   - Diagnostic procedures
   - Testing guidelines

3. **FPUMF_LINE_BY_LINE_FIXES.md**
   - Exact line numbers to change
   - Complete replacement code
   - Step-by-step implementation guide
   - Expected test output

4. **RESEARCH_SUMMARY.md** (this document)
   - Executive summary
   - Core findings
   - Critical issues identified
   - Implementation priorities

## Implementation Priority

### Phase 1: Critical Fix (Required)
1. Fix `sendFACARG` function (lines 267-307)
2. Compile and test with fptest_mf.pla
3. Verify no crashes or corruption

### Phase 2: Improvements (Recommended)
1. Update comments in `execMegaFlash`
2. Add diagnostic output for verification
3. Test thoroughly on Jace emulator

### Phase 3: Cleanup (Optional)
1. Remove diagnostic traces
2. Optimize code if needed
3. Final integration testing

## Expected Outcomes

### Before Fix
- Memory accesses near/beyond stack bounds
- Risk of VM data corruption
- Unstable behavior with complex calculations
- May work by accident on some inputs

### After Fix
- All memory accesses within stack bounds
- Safe, predictable behavior
- Stable operation on all inputs
- Follows established PLASMA patterns

## References

- **PLASMA Language Documentation:** `doc/PLASMA.md`
- **VM Zero Page Layout:** `vmsrc/apple/plvmzp.inc`
- **Working Examples:** `dhgr.tk/libs/dhgrlib.pla`, `libsrc/int32.pla`
- **PLEIADES Improvements:** `README.md` (32-word stack)

## Key Takeaways

1. **X IS the stack pointer** - maintained by VM
2. **ESP is a variable** - stores X value for bookkeeping
3. **Pop first, access backwards** - the safe pattern
4. **Forward indexing is dangerous** - easily exceeds bounds
5. **Follow DHGR examples** - proven working code
6. **Comments matter** - clear understanding prevents bugs

## Conclusion

The research conclusively shows that `fpumf.pla` has a fundamental misunderstanding of PLASMA's stack architecture. The forward indexing pattern in `sendFACARG` is dangerous and must be fixed. The DHGR library provides clear, working examples of the correct pattern. Implementing the fixes outlined in the accompanying documents will resolve the issues and align the code with PLASMA best practices.
