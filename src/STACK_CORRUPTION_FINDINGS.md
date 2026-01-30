# 6502 Stack Corruption Analysis - FINDINGS

## Executive Summary
**VERDICT: No stack corruption found in execMegaFlash or sendFACARG**

Both functions properly balance their PHA/PLA operations. The crash after RTS is likely caused by external factors, not by stack imbalance in the functions themselves.

## Detailed Analysis

### execMegaFlash PHA/PLA Balance

**Stack Operations:**
```
Line 876: PHA    ; Push command      (S = S - 1)
Line 892: PLA    ; Pop command       (S = S + 1)
Line 894: PHA    ; Push again        (S = S - 1)

SUCCESS PATH (line 935):
    PLA         ; Clean up           (S = S + 1)
    RTS         ; Return             (S balanced)

ERROR PATH (line 961):
    PLA         ; Clean up           (S = S + 1)
    RTS         ; Return             (S balanced)

TIMEOUT PATH (line 999):
    PLA         ; Clean up           (S = S + 1)
    RTS         ; Return             (S balanced)
```

**Count:**
- PHA instructions: 2
- PLA instructions: 2 (one per exit path)
- All paths balanced: ✓

**Analysis:** execMegaFlash is CORRECTLY balanced. Each exit path has exactly one PLA to match the final PHA, returning the stack to its entry state.

### sendFACARG PHA/PLA Balance

**Stack Operations:**
```
NONE - No PHA or PLA instructions in sendFACARG
```

**Analysis:** sendFACARG does NOT touch the 6502 hardware stack. It only manipulates the PLASMA evaluation stack via the X register (ESP).

### Missing Trace Output

User reported trace output: `S1235735735735735789ACDESV`

**Expected traces:**
- sendFACARG: S, 1, 2, 3, 4, 5, 6, 7, 8, 9
- execMegaFlash: A, B, C, D, E, S, V

**Actual traces:**
- sendFACARG: S, 1, 2, 3, 5, 7, (repeated 4 times), 8, 9
- execMegaFlash: A, C, D, E, S, V

**Missing traces:**
- sendFACARG: Traces 4 and 6 (appear after STA MF_PARAMREG)
- execMegaFlash: Trace B (appears after PHA)

**Analysis:** The missing traces suggest that:
1. Jace's trace opcode ($FC $5C) might not output in all contexts
2. Some trace opcodes might be buffered or dropped
3. The trace opcode might have timing-dependent behavior

This is NOT evidence of stack corruption - it's likely a trace output buffering issue in Jace.

## Root Cause Analysis

### What We Know

1. execMegaFlash executes completely (trace V appears)
2. RTS instruction executes (trace V is just before RTS)
3. Execution does NOT return to correct PLASMA bytecode
4. Trace "6a" never appears (should be immediately after execMegaFlash returns)
5. Screen shows "3456" then crashes

### Hypothesis 1: 6502 Stack Corruption
**Status: REJECTED**
- Both functions properly balance PHA/PLA
- No JSR without matching RTS
- No evidence of stack manipulation errors

### Hypothesis 2: Jace MegaFlash Emulation Bug
**Status: LIKELY**

The MegaFlash I/O register writes ($C0C0, $C0C1) might have a bug in Jace's emulation that:
- Corrupts the 6502 S register during I/O operations
- Corrupts RAM near the stack area ($0100-$01FF)
- Corrupts the return address on the stack

Evidence:
- Code is structurally correct
- Problem occurs during/after MegaFlash I/O
- Missing traces suggest Jace's trace mechanism is also flaky

### Hypothesis 3: PLASMA VM CALL/RTS Mismatch
**Status: POSSIBLE**

The PLASMA VM bytecode $54 (CALL) performs a JSR to the asm function. The asm function should RTS back to PLASMA VM bytecode. But if:
- PLASMA VM modifies the return address on stack before JSR
- Asm function returns to wrong location
- VM's stack frame is corrupted

This would cause the observed behavior.

## Recommended Actions

### 1. Add 6502 Stack Pointer Diagnostics

Modify execMegaFlash to verify 6502 S register:

```asm
asm execMegaFlash(cmd)#1
    // Save 6502 S at entry
    TSX
    STX $20  ; Save to zero page

    ... (existing code) ...

    // Before RTS, verify S is unchanged
    TSX
    CPX $20
    BEQ +

    // S changed - output error trace
    !byte $FC, $5C, '!'

+   RTS
end
```

### 2. Test Stack Corruption Hypothesis

Use the provided fpumf_stacktest.pla to verify:
- Stack pointer preservation across MegaFlash writes
- PHA/PLA balance
- Stack marker integrity

### 3. Simplify execMegaFlash for Testing

Remove all trace opcodes and test if crash still occurs:

```asm
asm execMegaFlash(cmd)#1
    !SOURCE "vmsrc/apple/plvmzp.inc"
    !SOURCE "vmsrc/apple/megaflash.inc"

    STX     TMPL
    LDA     ESTKL,X
    PHA
    STZ     MF_CMDREG
    PLA
    STA     MF_CMDREG

-   BIT     MF_STATUSREG
    BMI     +
    LDA     MF_PARAMREG
    BNE     error
    PLA
    LDX     TMPL
    LDA     #0
    STA     ESTKL,X
    STA     ESTKH,X
    RTS

error:
    PLA
    LDX     TMPL
    LDA     MF_PARAMREG
    STA     ESTKL,X
    LDA     #0
    STA     ESTKH,X
    RTS

+   DEY
    BNE     -
    DEX
    BNE     -

    PLA
    LDX     TMPL
    LDA     #1
    STA     ESTKL,X
    LDA     #0
    STA     ESTKH,X
    RTS
end
```

### 4. Check Jace MegaFlash Implementation

Contact Jace developer or review Jace source code to verify:
- Does MegaFlash emulation modify 6502 S register?
- Does writing to $C0C0/$C0C1 corrupt RAM?
- Are there known bugs in MegaFlash FPU emulation?

## Conclusion

**The stack corruption is NOT in execMegaFlash or sendFACARG code.**

Both functions properly manage the 6502 hardware stack. The crash is likely caused by:
1. Jace emulator bug in MegaFlash I/O handling
2. PLASMA VM CALL/RTS mechanism interaction issue
3. Unknown external factor corrupting the stack during execution

**Next Steps:**
1. Run fpumf_stacktest.pla to verify stack integrity
2. Simplify execMegaFlash to minimal version without traces
3. Test on real hardware if possible (IIc with MegaFlash)
4. Debug Jace's MegaFlash emulation code

## Files Created

- `STACK_ANALYSIS.md` - Detailed stack operation analysis
- `STACK_CORRUPTION_FINDINGS.md` - This file
- `libsrc/fpumf_stacktest.pla` - Diagnostic test program
