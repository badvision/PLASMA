# Complete Analysis: The Mystery of the 76-Byte Offset

## Binary Structure Analysis

### Overview
The FPUMF#FE1000 binary contains two functions:
1. **waitMegaFlash()** - at offset 0x0137-0x014B (21 bytes)
2. **execMegaFlash()** - starts at offset 0x014C

Between them is 55 bytes of zero padding (0x0100-0x0136).

### Detailed Byte Breakdown

```
Offset 0x0100-0x0136 (55 bytes): ZERO PADDING
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00

Offset 0x0137-0x014B (21 bytes): waitMegaFlash() FUNCTION CODE
  0x0137: A2 00       LDX #$00              ; Set X = 0 (timeout counter high byte)
  0x0139: A0 00       LDY #$00              ; Set Y = 0 (timeout counter low byte)

  0x013B: 2C C0 C0    BIT $C0C0            ; Test MF_STATUSREG
  0x013E: 10 09       BPL +9               ; If bit 7 clear (not busy), jump to success

  0x0140: 88          DEY                  ; Decrement Y
  0x0141: D0 F8       BNE $F8              ; If Y != 0, loop back to BIT

  0x0143: CA          DEX                  ; Decrement X
  0x0144: D0 F5       BNE $F5              ; If X != 0, loop back to BIT

  ; Timeout path
  0x0146: A9 01       LDA #$01             ; Return timeout error (1)
  0x0148: 60          RTS

  ; Success path
  0x0149: A9 00       LDA #$00             ; Return success (0)
  0x014B: 60          RTS

Offset 0x014C: execMegaFlash() FUNCTION STARTS HERE
  0x014C: FC 5C 41    TRACE 'A'            ; Entry point trace
  0x014F: EA          NOP                  ; Padding
  ...
```

## Why the 76-Byte Offset Exists

The 76 bytes (55 zeros + 21 bytes of code) represent:
1. **Module header padding** - The PLASMA module system aligns code sections
2. **waitMegaFlash() function** - Comes BEFORE execMegaFlash() in the binary
3. The PLASMA compiler laid out functions in source order:
   - First: `asm waitMegaFlash` (lines 795-835 in fpumf.a)
   - Second: `asm execMegaFlash` (lines 845+ in fpumf.a)

## Why Only Traces E and F Execute

Looking at the trace output from the previous test:
```
TRACE OUTPUT:
Character 'E' (0x45) at offset 0x0198
Character 'F' (0x46) at offset 0x01A7
```

**Traces A, B, C, D are at offset 0x014C and later, but they NEVER execute.**

This is because:

1. **execMegaFlash() is being CALLED, not JUMPED to**
   - When PLASMA calls a function, it uses the function's **export table entry**
   - The export table may point to a **wrapper** or **different entry point**

2. **There's likely a parameter handling wrapper BEFORE trace A**
   - Trace E (at 0x0198) is far past the beginning of execMegaFlash
   - This suggests the function has parameter setup code before the main logic

3. **The actual execution flow:**
   ```
   PLASMA calls execMegaFlash
     → Jumps to WRAPPER code (before 0x014C)
     → Parameter handling happens
     → Execution continues to offset 0x0198 (Trace E)
     → Main function logic executes
     → Trace F at 0x01A7
   ```

## What We Need to Examine Next

To fully understand why execution starts at 0x0198 instead of 0x014C, we need to:

1. **Find the module export table** in FPUMF#FE1000
   - This will show where PLASMA actually jumps when calling execMegaFlash

2. **Disassemble bytes 0x014C through 0x0197**
   - These 76 bytes contain traces A, B, C, D
   - If they don't execute, what ARE they?
   - Are they dead code?
   - Are they being skipped by a JMP instruction?

3. **Check for a JMP instruction**
   - Look for: `4C xx xx` (JMP absolute)
   - This would explain skipping from entry to offset 0x0198

## The waitMegaFlash Function Analysis

The waitMegaFlash function is a **hardware polling loop** that:

1. Sets up a 16-bit timeout counter (X:Y = 256 * 256 = 65,536 iterations)
2. Polls the MegaFlash status register ($C0C0) using BIT instruction
3. Tests bit 7 (busy flag):
   - If clear: hardware is ready → return 0 (success)
   - If set: hardware is busy → continue waiting
4. Decrements the 16-bit counter on each iteration
5. If counter reaches zero → return 1 (timeout error)

This function executes COMPLETELY IN ASSEMBLY with no PLASMA VM involvement, making it very efficient for hardware polling.

## Key Findings Summary

1. **The 76 bytes are NOT a mystery** - they're the waitMegaFlash() function plus padding
2. **waitMegaFlash occupies bytes 0x0137-0x014B** (21 bytes of 6502 code)
3. **55 bytes of zeros (0x0100-0x0136)** are module alignment padding
4. **execMegaFlash starts at 0x014C** but execution begins at 0x0198
5. **Something skips the first 76 bytes of execMegaFlash** - need to find what

## Next Investigation Steps

**PRIORITY**: Disassemble bytes 0x014C-0x0197 to find the skip mechanism:
```bash
od -A x -t x1 -j 332 -N 76 rel/FPUMF#FE1000
```

This will reveal:
- Where traces A, B, C, D are located
- If there's a JMP instruction skipping them
- What the actual entry point wrapper code does
