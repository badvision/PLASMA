# Root Cause Analysis: "FDEF" Output and Out-of-Order Trace Letters

## Problem Summary

**Observed Behavior:**
- Program outputs: `3456FDEF` then crashes
- Expected output: `3456ABCDEF`
- Actual trace letters: F, D, E, F (A, B, C missing, F appears TWICE)

## Critical Analysis

### What is FDEF?

`$FDEF` is NOT a trace letter we're printing. It's appearing because:

1. **$FDED is the Monitor COUT routine** - This is what we're calling to print trace letters
2. **$FDEF is TWO BYTES after $FDED** - This suggests PC corruption or return address issues
3. **The sequence "FDEF" contains our trace letters** - F, D, E, F are valid trace points, but OUT OF ORDER

### Why Are Trace Letters Out of Order?

Our trace points should execute sequentially:
```
A → B → C → D → E → F
```

But we're seeing:
```
F, D, E, F
```

This means:
- **Trace point A never executed** (or output was corrupted)
- **Trace point B never executed** (or output was corrupted)
- **Trace point C never executed** (or output was corrupted)
- **Execution jumped to trace point F prematurely**
- **Then jumped backwards to D, E, then F again**

### Root Cause: JSR $FDED Corrupts Critical State

The `JSR $FDED` (COUT) calls are **corrupting the PLASMA evaluation stack pointer (ESP)**.

#### Why This Happens:

1. **COUT modifies X register** - The Monitor COUT routine uses X internally
2. **We load ESP into X** - Before reading the command: `LDX ESP`
3. **COUT corrupts X** - After JSR $FDED, X may have different value
4. **We use X again** - After COUT, we do `LDA ESTKL,X` with corrupted X
5. **Wrong stack location accessed** - We read garbage or wrong command
6. **PC jumps to invalid address** - Eventually causes crash

#### Evidence:

```assembly
LDX     ESP                 // X = stack pointer (e.g., 5)
LDA     ESTKL,X             // Get command from stack[5]
PHA                         // Save command
LDA     #'A'
JSR     $FDED              // COUT - CORRUPTS X!!!
PLA                         // Restore command
```

**After the JSR $FDED, X may now be 0, 1, 2, or garbage!**

When we later do:
```assembly
LDX     ESP                 // X should be 5
LDA     MF_PARAMREG
STA     ESTKL,X             // Store to WRONG location!
```

We're storing the result to the **wrong stack position** because ESP or X was corrupted.

### Why "FDEF" Specifically?

The sequence "FDEF" might be:
1. **Return address bytes on stack** - When RTS happens with corrupted stack, it returns to $FDEF
2. **Monitor ROM address** - $FDEF is in the Monitor ROM space ($F000-$FFFF)
3. **Error handler address** - Apple II Monitor may jump to $FDEF on certain errors
4. **Corrupted PC visualization** - The system is trying to show where it crashed

### Why F, D, E, F Order?

This suggests:
1. **First F** - Execution jumped directly to trace point F (before RTS)
2. **D, E** - Something caused execution to jump backwards to the wait loop completion
3. **Second F** - Execution reached trace point F again, then crashed

This pattern indicates **severe stack corruption** causing multiple jumps through the code.

## Solutions

### Solution 1: Preserve ALL Registers Around COUT

```assembly
asm execMegaFlashFixed(cmd)#1
    LDX     ESP
    LDA     ESTKL,X             // Get command code

    // Trace A: PRESERVE ALL REGISTERS
    PHA                         // Save A
    TXA                         // Transfer X to A
    PHA                         // Save X
    TYA                         // Transfer Y to A
    PHA                         // Save Y
    PHP                         // Save processor status

    LDA     #'A'
    JSR     $FDED              // COUT

    PLP                         // Restore processor status
    PLA                         // Restore Y
    TAY
    PLA                         // Restore X
    TAX
    PLA                         // Restore A

    // Now A, X, Y, P are all restored
```

**Problem**: This is VERBOSE and adds significant code size.

### Solution 2: Memory-Mapped Trace (RECOMMENDED)

Instead of calling COUT during critical operations, write trace letters to a memory buffer:

```assembly
asm execMegaFlashMemTrace(cmd)#1
    TRACE_BUF = $0380    // Text page 1 hole (safe memory)
    TRACE_IDX = $037F    // Current trace index

    LDX     ESP
    LDA     ESTKL,X             // Get command code

    // Trace A: Store to memory (fast, safe, no register corruption)
    PHA
    LDY     TRACE_IDX
    LDA     #'A'
    STA     TRACE_BUF,Y
    INY
    STY     TRACE_IDX
    PLA

    // Continue with rest of function...
```

**After the crash**, examine memory `$0380-$03FF` to see the trace sequence.

### Solution 3: Zero Page Trace (SIMPLEST)

Use dedicated zero page locations for each trace point:

```assembly
TRACE_A = $F0
TRACE_B = $F1
TRACE_C = $F2
TRACE_D = $F3
TRACE_E = $F4
TRACE_F = $F5

asm execMegaFlashZPTrace(cmd)#1
    // Trace A
    LDA     #'A'
    STA     TRACE_A          // No JSR, no corruption

    // Trace B
    LDA     #'B'
    STA     TRACE_B

    // etc...
```

**After the crash**, examine `$F0-$F5` to see which trace points were hit.

### Solution 4: Remove Trace Points, Add Post-Mortem Debugging

Since trace points are causing the problem, **remove them entirely** and add:

1. **Memory dump routine** to examine MegaFlash registers after crash
2. **Stack validation** before and after MegaFlash calls
3. **Register preservation** in all assembly routines

## Recommended Next Steps

1. **Implement Solution 2 or 3** (memory-mapped or zero page trace)
2. **Add ESP validation** before and after MegaFlash operations:
   ```assembly
   // Before
   LDX     ESP
   STX     $F0    // Save ESP

   // ... operation ...

   // After
   LDX     ESP
   CPX     $F0    // Compare with saved ESP
   BEQ     +      // OK if equal
   // ERROR: ESP corrupted!
   ```
3. **Check if MegaFlash hardware modifies zero page** when accessed
4. **Verify MF_CMDREG and MF_PARAMREG don't have side effects** on ZP

## Additional Hypothesis

### Could MegaFlash Hardware Be Corrupting Zero Page?

**YES - This is very possible!**

When we access `MF_CMDREG` ($C0C0) or `MF_PARAMREG` ($C0C1), the **MegaFlash hardware might be modifying zero page locations** as side effects.

**This would explain:**
- Why ESP gets corrupted
- Why execution jumps around unpredictably
- Why trace letters appear out of order

**Test This:**
1. Before accessing MegaFlash: dump ZP $00-$FF to memory
2. After accessing MegaFlash: compare ZP to saved values
3. Identify which ZP locations are being modified

If MegaFlash **DOES modify zero page**, we need to:
- **Save and restore affected ZP locations** around MegaFlash operations
- **Identify which ZP locations are safe to use** for trace variables
- **Use PLASMA's saveZP/restoreZP** mechanisms (already in place for SANE)

## Conclusion

The "FDEF" output is a **symptom of stack/register corruption** caused by:
1. **JSR $FDED (COUT) corrupting registers** (likely X)
2. **Subsequent code using corrupted registers** to access wrong stack locations
3. **Return address corruption** causing PC to jump to $FDEF
4. **Possible MegaFlash hardware side effects** on zero page

**Immediate action**: Replace COUT-based tracing with memory-mapped tracing to avoid register corruption during critical operations.

**Long-term action**: Investigate if MegaFlash hardware modifies zero page and add appropriate preservation if needed.
