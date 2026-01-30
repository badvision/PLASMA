# 6502 Stack Corruption Analysis

## Problem Description
User sees traces: `S1235735735735735789ACDESV`
Then screen shows `3456` then crash.
Trace `6a` never appears (should be after execMegaFlash returns).

This means:
- execMegaFlash executes completely (trace V appears)
- RTS executes
- But returns to WRONG ADDRESS
- PLASMA VM does NOT continue executing next bytecode

## Stack Operation Analysis

### execMegaFlash (lines 846-1018)

6502 Hardware Stack Operations:
```
Line 876: PHA    ; Push command      S = S-1
Line 892: PLA    ; Pop command       S = S+1
Line 894: PHA    ; Push again        S = S-1

SUCCESS PATH:
Line 935: PLA    ; Clean up          S = S+1
Line 952: RTS    ; Return

ERROR PATH:
Line 961: PLA    ; Clean up          S = S+1
Line 980: RTS    ; Return

TIMEOUT PATH:
Line 999: PLA    ; Clean up          S = S+1
Line 1018: RTS   ; Return
```

**Stack Balance: CORRECT**
- Entry: S = X
- Exit: S = X (after PLA restores)

### sendFACARG (lines 1027-1175)

6502 Hardware Stack Operations:
```
NONE - No PHA, no PLA instructions
```

**Stack Balance: CORRECT**

## The Mystery

Both functions have balanced 6502 stacks. But RTS returns to wrong address.

## Key Observations

1. **PLASMA ESP vs 6502 S are different**
   - X register holds PLASMA evaluation stack pointer (ESP)
   - 6502 S register holds hardware stack pointer
   - They are INDEPENDENT

2. **execMegaFlash modifies X**
   - Line 861: `STX TMPL` - Saves ESP
   - Line 912: `LDX #$00` - Uses X as loop counter
   - Line 937: `LDX TMPL` - Restores ESP

3. **PLASMA CALL mechanism**
   - PLASMA VM does: `JSR address`
   - Called function does: `RTS`
   - Return address on 6502 stack must be preserved

## Hypothesis: X register corruption during tight loop

Looking at lines 912-917:
```asm
Line 912: LDX #$00              ; X = 0 for timeout counter
Line 915: -   BIT MF_STATUSREG
Line 917:     BMI ++             ; Continue if busy
```

The tight wait loop uses X as a counter. But what if the loop executes
MANY times and something else happens?

**WAIT - I found it!**

Look at line 861 and 937:
```asm
Line 861: STX TMPL   ; Save ESP to TMPL
...
Line 937: LDX TMPL   ; Restore ESP from TMPL
```

TMPL is a ZERO PAGE location. But what if something ELSE uses TMPL
during the wait loop?

**Checking TMPL definition:**
```
TMPL = TMP = JMPTMP+1 = ESP+2
```

From plvmzp.inc line 27-28.

## THE BUG FOUND!

The wait loop in execMegaFlash uses X and Y as loop counters.
But it does NOT save/restore the original X value before the RTS!

Look carefully at the SUCCESS path:
```asm
Line 935: PLA                 ; Clean up hardware stack
Line 937: LDX TMPL            ; Restore ESP from TMPL  ← GOOD
Line 939: LDA #$00            ; Return 0
Line 941: STA ESTKL,X         ; Store on PLASMA stack
Line 943: STA ESTKH,X
Line 947: RTS                 ; Return with X = TMPL value
```

This looks correct. But wait...

## EXAMINING THE ACTUAL PROBLEM

User said trace 'B' is missing from output. Looking at the trace:
`ACDESV` should be `ABCDESV`

Trace B is at line 880:
```asm
Line 878: !byte $FC, $5C, 'B'
```

This is RIGHT AFTER the PHA at line 876!

If trace B doesn't appear, execution is jumping OVER line 880.

**THIS MEANS: The bytecode $FC (trace) is being misinterpreted!**

Let me check the trace opcode implementation...
