# PLASMA Assembly Function Research and Best Practices

## Executive Summary

After thorough research of PLASMA documentation, complex library implementations (DHGR, int32), and VM internals, I have identified critical mistakes in `fpumf.pla` and documented proper PLASMA assembly function conventions.

## Key Finding: ESP is a VARIABLE, not a constant!

**CRITICAL MISTAKE IN fpumf.pla:**
```asm
// WRONG - This treats ESP as a constant address
LDX     #$00
STX     ESP        // Stores 0 to memory address $E5

// This would be: Store 0 to address $E5, not "set X to ESP"
```

**CORRECT Understanding:**
- `ESP` is a zero-page variable at address `$E5` that STORES the current stack pointer
- The X register IS the evaluation stack pointer
- X is already set by the VM when your function is called
- You should NEVER manually load ESP's value into X

## PLASMA Evaluation Stack Architecture

### Memory Layout (from plvmzp.inc)

```
ESGUARD = $9E    ; Stack guard byte
ESTKSZ  = $40    ; Stack size = 64 bytes = 32 words
ESTK    = $A0    ; Stack base address
ESTKH   = $A0    ; High bytes: $A0-$BF (32 bytes)
ESTKL   = $C0    ; Low bytes:  $C0-$DF (32 bytes)
VMZP    = $E0    ; VM zero page variables start
ESP     = $E5    ; Stack pointer VARIABLE (not the pointer itself!)
```

### Stack Structure

The PLASMA evaluation stack is **split** into two regions:
- **High bytes**: `$A0` to `$BF` (ESTKH)
- **Low bytes**: `$C0` to `$DF` (ESTKL)

Each 16-bit value occupies two locations:
- `ESTKH,X` contains the high byte
- `ESTKL,X` contains the low byte

### Stack Indexing

**X Register = Current Stack Top**
- Valid range: `0` to `31` (`$00` to `$1F`)
- Stack grows DOWN (push = DEX, pop = INX)
- X is ALWAYS maintained by the VM
- X points to the TOP element (last pushed value)

**ESP Variable** (`$E5`):
- Stores the current value of X for context switching
- Used by VM for saving/restoring stack state
- **NEVER directly manipulated by assembly functions**

## From PLASMA Documentation (doc/PLASMA.md)

### Native Assembly Functions (line 1243)

> Native assembly functions are only available on the cross-compiler. Assembly code in PLASMA is implemented strictly as a pass-through to the assembler. No syntax checking, or checking at all, is made.

Key points:
1. **X register access**: "Data passed in on the PLASMA evaluation stack is readily accessed with the X register and the zero page address of the ESTK."
2. **X register discipline**: "The X register must be properly saved, incremented, and/or decremented to remain consistent with the rest of PLASMA."
3. **Parameter popping**: "Parameters are **popped** off the evaluation stack with `INX`"
4. **Return value pushing**: "The return value is **pushed** with `DEX`"

### Evaluation Stack (line 1277)

> All calculations, data moves, and parameter passing are done on the evaluation stack. This stack is located on the zero page of the 6502... The 6502's X register is used to index into the evaluation stack. It *always* points to the top of the evaluation stack, so care must be taken to save and restore its value when calling native 6502 code.

**Critical:** The X register *always* points to the top of the stack. The VM maintains this. Your assembly function receives X already set correctly.

### Stack Size Increase in PLEIADES

From README.md line 11:
> "Increase evaluation stack size to 32 entries for more complex algorithms"

This is already reflected in `ESTKSZ = $40` (64 bytes = 32 words).

## Assembly Function Best Practices (from DHGR and int32 libraries)

### Pattern 1: Function with Parameters

From `dhgrlib.pla` line 444:
```asm
asm dcgrPlotScr(x, y)#0
    INX                 ; Pop first parameter
    INX                 ; Pop second parameter
    STX     ESP         ; Save stack pointer
    LDY     ESTKL-2,X   ; Y COORD (2nd param from original top)
    CPY     #192
    BCS     RETPLTS
end
```

**Key observations:**
1. Function pops parameters first (INX moves away from stack top)
2. After popping, `STX ESP` saves the new stack position
3. Parameters accessed relative to NEW X position: `ESTKL-2,X` looks back
4. Returns via RTS with X already adjusted

### Pattern 2: Function Returning Value

From `int32.pla` line 22:
```asm
export asm zext16to32#0
    LDA     #$00
    STA     ACCUM32+2
    STA     ACCUM32+3
    RTS
end
```

Functions that return values don't need to modify the stack - they return data via memory locations or by leaving values on the stack.

### Pattern 3: Preserving X for Loops

From `dhgrlib.pla` line 320:
```asm
asm _clipX#0
    STA     TMPL        ; DST_WIDTH
    LDA     ESTKH-1,X   ; X COORD
    BMI     NEGX        ; IS NEG?
    LDA     ESTKL-1,X   ; X COORD
    CMP     TMPL        ; > DST_WIDTH?
    BCS     INVISX      ; YEP, X OFF RIGHT EDGE
    ...
    RTS
end
```

If you need to use X as a loop counter:
1. Save original X to a zero-page variable (like TMP)
2. Use X for your loop
3. Restore X before RTS

**NEVER** use `STX ESP` as a way to "save" X - that's updating the VM's stack pointer variable!

## What fpumf.pla Was Doing Wrong

### Mistake 1: Misunderstanding ESP

```asm
// WRONG CODE from fpumf.pla
asm execMegaFlash(cmd)#1
    STX     TMPL            // Trying to "save ESP"

    LDA     ESTKL,X         // Get command

    LDX     TMPL            // "Restore ESP"
    RTS
end
```

**Why this is wrong:**
- `STX TMPL` saves the stack pointer value (correct for loop counter)
- BUT: code never uses X as a loop counter!
- `LDX TMPL` restores X (technically works but pointless)
- **Real issue**: Accessing parameters incorrectly

### Mistake 2: Wrong Parameter Access

```asm
// From sendFACARG(pFAC, pARG, facExt)#0
asm sendFACARG(pFAC, pARG, facExt)#0
    // X already contains ESP from VM

    LDA     ESTKL+2,X       // WRONG: This is forward indexing
    STA     $06
```

**Why this is wrong:**
- Parameters are pushed in order: pFAC, pARG, facExt
- Stack grows down, so newest parameter (facExt) is at X
- Should be: `ESTKL,X` = facExt, `ESTKL+1,X` = pARG, `ESTKL+2,X` = pFAC
- BUT after popping: need to access backwards with `-` offset

**Correct pattern:**
```asm
asm sendFACARG(pFAC, pARG, facExt)#0
    // X points to top (facExt)
    // Parameters on stack: [pFAC+2] [pARG+1] [facExt]
    //                              ↑         ↑       ↑
    //                            oldest    middle  newest (X)

    // Option A: Pop then reference backwards
    INX                     ; Pop facExt
    INX                     ; Pop pARG
    INX                     ; Pop pFAC
    STX     ESP             ; Save new stack top

    LDA     ESTKL-3,X       ; facExt (3 back from new position)
    STA     $0A
    LDA     ESTKL-2,X       ; pARG low
    STA     $08
    LDA     ESTKH-2,X       ; pARG high
    STA     $09
    LDA     ESTKL-1,X       ; pFAC low
    STA     $06
    LDA     ESTKH-1,X       ; pFAC high
    STA     $07

    RTS
```

## Correct Assembly Function Template

### Template 1: Function with Parameters, No Return Value

```asm
asm myFunc(param1, param2, param3)#0
    !SOURCE "vmsrc/apple/plvmzp.inc"

    // X points to top of stack (param3)
    // Stack layout: [param1+2] [param2+1] [param3] <- X

    // Option A: Pop all parameters first
    INX                     ; Move past param3
    INX                     ; Move past param2
    INX                     ; Move past param1
    STX     ESP             ; Update stack pointer variable

    // Now access parameters backwards from new position
    LDA     ESTKL-3,X       ; param3
    STA     TMPL
    LDA     ESTKL-2,X       ; param2 low byte
    LDA     ESTKH-2,X       ; param2 high byte
    LDA     ESTKL-1,X       ; param1 low byte
    LDA     ESTKH-1,X       ; param1 high byte

    // ... function body ...

    RTS                     ; X already adjusted, ESP already saved
end
```

### Template 2: Function with Parameters, Returns Value

```asm
asm myFunc(param1, param2)#1
    !SOURCE "vmsrc/apple/plvmzp.inc"

    // Parameters on stack, X points to top
    // We need to leave one slot for return value

    INX                     ; Pop param2
    INX                     ; Pop param1
    // DON'T pop the return slot
    STX     ESP

    // Access parameters
    LDA     ESTKL-2,X       ; param2
    LDA     ESTKL-1,X       ; param1

    // ... calculate result ...

    // Store result in return slot (at X)
    LDA     #$00            ; Result low byte
    STA     ESTKL,X
    LDA     #$01            ; Result high byte
    STA     ESTKH,X

    RTS
end
```

### Template 3: Function Needing X as Loop Counter

```asm
asm myLoopFunc(param)#0
    !SOURCE "vmsrc/apple/plvmzp.inc"

    // Save ESP (X) to use X for loops
    STX     TMPL            ; Save stack pointer

    // Pop parameters
    INX

    // Get parameter value before X changes
    LDY     ESTKL-1,X       ; Load param to Y

    // Now X is free for loops
    LDX     #$00
-   // ... loop body using X ...
    INX
    CPX     #$10
    BNE     -

    // Restore stack pointer
    LDX     TMPL
    STX     ESP

    RTS
end
```

## Testing Recommendations

### Verify Stack Pointer Values

Add diagnostics to print X register at function entry:
```asm
asm testFunc(param)#0
    !SOURCE "vmsrc/apple/plvmzp.inc"

    // Debug: Print ESP value
    TXA
    !byte $FC, $5D          ; Jace trace - print A

    // Continue with function...
end
```

Expected X values:
- Start of program: X ≈ $1F (31, near bottom of empty stack)
- After pushing 1 param: X = $1E (30)
- After pushing 3 params: X = $1C (28)
- After function pops 3 params: X = $1F (back to 31)

### Verify Memory Access

Check that parameter accesses don't exceed stack bounds:
```asm
// BAD: X=$1E, accessing ESTKL+10,X = ESTKL+$28 = $E8 (outside stack!)
LDA     ESTKL+10,X

// GOOD: X=$1E, accessing ESTKL,X = $C0+$1E = $DE (valid)
LDA     ESTKL,X
```

Stack bounds:
- `ESTKH`: `$A0` to `$BF` (high bytes)
- `ESTKL`: `$C0` to `$DF` (low bytes)
- Valid X: `$00` to `$1F` (0 to 31)

## Comparison: fpumf.pla vs Correct Implementation

### Current fpumf.pla (WRONG)

```asm
asm sendFACARG(pFAC, pARG, facExt)#0
    // X already contains ESP from VM

    TXA
    !byte $FC, $5D          // Print ESP (shows X ≈ $1C)

    LDA     ESTKL+2,X       // pFAC low  <- WRONG: forward access
    STA     $06
    LDA     ESTKH+2,X       // pFAC high <- WRONG
    STA     $07

    LDA     ESTKL+1,X       // pARG low  <- WRONG
    STA     $08
    LDA     ESTKH+1,X       // pARG high <- WRONG
    STA     $09

    LDA     ESTKL,X         // facExt    <- This one is correct
    STA     $0A

    INX                     // Pop 3 parameters
    INX
    INX
    // Missing: STX ESP

    RTS
end
```

**Problems:**
1. Forward indexing (`ESTKL+2,X`) goes beyond stack bounds
2. With X=$1C, `ESTKL+2,X` = `$C0+$1E` = `$DE` (barely valid)
3. With X=$1C, `ESTKL+3,X` = `$C0+$1F` = `$DF` (last valid byte)
4. With X=$1C, `ESTKL+4,X` = `$C0+$20` = `$E0` = VMZP (CORRUPTING VM DATA!)
5. Missing `STX ESP` after popping parameters

### Corrected Version

```asm
asm sendFACARG(pFAC, pARG, facExt)#0
    !SOURCE "vmsrc/apple/plvmzp.inc"
    !SOURCE "vmsrc/apple/megaflash.inc"

    // Pop all 3 parameters
    INX
    INX
    INX
    STX     ESP             // Update stack pointer variable

    // Access parameters backwards from new position
    LDA     ESTKL-3,X       // facExt (byte)
    STA     $0A

    LDA     ESTKL-2,X       // pARG low
    STA     $08
    LDA     ESTKH-2,X       // pARG high
    STA     $09

    LDA     ESTKL-1,X       // pFAC low
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

## Summary of Findings

### What We Learned

1. **ESP is a variable** at `$E5`, not the stack pointer itself
2. **X register IS the stack pointer** - maintained by VM
3. **Stack size is 32 words** (64 bytes), indexed 0-31
4. **Stack is split** into high bytes (`$A0-$BF`) and low bytes (`$C0-$DF`)
5. **Parameters are popped with INX**, returns pushed with DEX
6. **Access popped parameters backwards** using negative offsets

### What fpumf.pla Was Doing Wrong

1. Treating ESP as a constant to load into X
2. Using forward indexing to access parameters
3. Accessing beyond stack bounds (corrupting VMZP data)
4. Not following established patterns from DHGR/int32 libraries

### Required Fixes

1. Remove all `LDX #ESP` and `LDX ESP` patterns
2. Change parameter access from `ESTKL+N,X` to `ESTKL-N,X` after popping
3. Add `STX ESP` after popping parameters (when appropriate)
4. Follow DHGR library patterns for assembly functions

## References

1. **PLASMA Documentation**: `/Users/brobert/Documents/code/PLASMA/doc/PLASMA.md`
   - Lines 1241-1243: Native Assembly Functions
   - Lines 1273-1278: Evaluation Stack architecture

2. **Zero Page Layout**: `/Users/brobert/Documents/code/PLASMA/src/vmsrc/apple/plvmzp.inc`
   - Defines ESTKSZ, ESTK, ESP, and memory layout

3. **DHGR Library**: `/Users/brobert/Documents/code/PLASMA/src/dhgr.tk/libs/dhgrlib.pla`
   - Lines 444-529: Complex assembly functions with parameters
   - Demonstrates proper parameter handling and stack management

4. **int32 Library**: `/Users/brobert/Documents/code/PLASMA/src/libsrc/int32.pla`
   - Lines 9-29: Simple assembly functions
   - Shows proper zero page variable usage

5. **PLEIADES README**: `/Users/brobert/Documents/code/PLASMA/README.md`
   - Line 11: Documents stack size increase to 32 entries

## Next Steps

1. **Audit all assembly functions in fpumf.pla**
2. **Fix parameter access patterns** (forward → backward after popping)
3. **Remove ESP misuse** (no more `LDX #ESP`)
4. **Add proper stack management** (`STX ESP` after parameter popping)
5. **Test with known-good values** to verify correct operation
6. **Run fptest_mf.pla** to validate all FPU operations
