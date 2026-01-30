# fpumf.pla Line-by-Line Fix Guide

This document shows exactly which lines need to be changed in fpumf.pla to fix the stack access issues.

## Assembly Function Locations

- Line 118: `waitMegaFlash` - No parameters, correct as-is
- Line 152: `execMegaFlash(cmd)#1` - Needs minor cleanup
- Line 267: `sendFACARG(pFAC, pARG, facExt)#0` - **CRITICAL FIX NEEDED**
- Line 369: `receiveFAC(pResult)#1` - Correct as-is

## Critical Fix #1: sendFACARG (Lines 267-362)

### Current Code (WRONG)

```asm
267: asm sendFACARG(pFAC, pARG, facExt)#0
268:     !SOURCE "vmsrc/apple/plvmzp.inc"
269:     !SOURCE "vmsrc/apple/megaflash.inc"
270:
271:     // Trace S: Entry to sendFACARG
272:     !byte $FC, $5C, 'S'
273:
274:     // X already contains ESP from VM              <- WRONG COMMENT
275:
276:     // DIAGNOSTIC: Print ESP value
277:     TXA
278:     !byte $FC, $5D
279:
280:     // Get pointers
281:     LDA     ESTKL+2,X       // pFAC low           <- WRONG: FORWARD ACCESS
282:     STA     $06
283:     LDA     ESTKH+2,X       // pFAC high          <- WRONG: FORWARD ACCESS
284:     STA     $07
285:
286:     LDA     ESTKL+1,X       // pARG low           <- WRONG: FORWARD ACCESS
287:     STA     $08
288:     LDA     ESTKH+1,X       // pARG high          <- WRONG: FORWARD ACCESS
289:     STA     $09
290:
291:     LDA     ESTKL,X         // facExt             <- CORRECT
292:     STA     $0A
293:
294:     // Pop 3 parameters (VM handles ESP variable) <- MISLEADING COMMENT
295:     INX
296:     INX
297:     INX
298:                                                    <- MISSING: STX ESP
```

### Fixed Code (CORRECT)

```asm
267: asm sendFACARG(pFAC, pARG, facExt)#0
268:     !SOURCE "vmsrc/apple/plvmzp.inc"
269:     !SOURCE "vmsrc/apple/megaflash.inc"
270:
271:     // Trace S: Entry to sendFACARG
272:     !byte $FC, $5C, 'S'
273:
274:     // X points to top of stack (facExt parameter)
275:     // Parameters: [pFAC+2] [pARG+1] [facExt] <- X
276:
277:     // DIAGNOSTIC: Print X (stack pointer) at entry
278:     TXA
279:     !byte $FC, $5D
280:
281:     // Pop all 3 parameters first
282:     INX                     // Move past facExt
283:     INX                     // Move past pARG
284:     INX                     // Move past pFAC
285:     STX     ESP             // Update stack pointer variable
286:
287:     // DIAGNOSTIC: Print X after popping
288:     TXA
289:     !byte $FC, $5D
290:
291:     // Access parameters backwards from new position
292:     LDA     ESTKL-3,X       // facExt (3 back from current X)
293:     STA     $0A
294:
295:     // DIAGNOSTIC: Print facExt value
296:     !byte $FC, $5D
297:
298:     LDA     ESTKL-2,X       // pARG low (2 back)
299:     STA     $08
300:     LDA     ESTKH-2,X       // pARG high
301:     STA     $09
302:
303:     LDA     ESTKL-1,X       // pFAC low (1 back)
304:     STA     $06
305:     LDA     ESTKH-1,X       // pFAC high
306:     STA     $07
307:
308:     // Trace 1: Got all parameters, about to reset buffer
309:     !byte $FC, $5C, '1'
```

### Line-by-Line Changes

**DELETE these lines:**
- Line 274: Wrong comment about ESP
- Line 276: Old comment about ESP value

**REPLACE lines 280-297 with:**
```asm
    // Pop all 3 parameters first
    INX                     // Move past facExt
    INX                     // Move past pARG
    INX                     // Move past pFAC
    STX     ESP             // Update stack pointer variable

    // DIAGNOSTIC: Print X after popping
    TXA
    !byte $FC, $5D

    // Access parameters backwards from new position
    LDA     ESTKL-3,X       // facExt (3 back from current X)
    STA     $0A

    // DIAGNOSTIC: Print facExt value
    !byte $FC, $5D

    LDA     ESTKL-2,X       // pARG low (2 back)
    STA     $08
    LDA     ESTKH-2,X       // pARG high
    STA     $09

    LDA     ESTKL-1,X       // pFAC low (1 back)
    STA     $06
    LDA     ESTKH-1,X       // pFAC high
    STA     $07
```

**Key changes:**
1. Pop parameters FIRST (lines 282-285)
2. Add `STX ESP` after popping (line 285)
3. Change `ESTKL+N,X` to `ESTKL-N,X` (backward indexing)
4. Correct parameter order: facExt=-3, pARG=-2, pFAC=-1
5. Add diagnostics to verify X values

## Minor Fix #2: execMegaFlash (Lines 152-260)

### Current Code Issues

```asm
152: asm execMegaFlash(cmd)#1
153:     !SOURCE "vmsrc/apple/plvmzp.inc"
154:     !SOURCE "vmsrc/apple/megaflash.inc"
155:
156:     // Enable tracing for entire function execution
157:     !byte $FC, $65, $01
158:
159:     / Trace A: Entry point - got command from stack
160:     !byte $FC, $5C, 'A'
161:
162:     // Save ESP (X register) to TMP before using X as loop counter  <- MISLEADING
163:     STX     TMPL
164:
165:     // DIAGNOSTIC: Print ESP value (X already contains ESP from VM) <- WRONG
166:     TXA
167:     !byte $FC, $5D            // Print A register (ESP value)    <- WRONG
168:
169:     / DIAGNOSTIC: Print command value from stack
170:     LDA     ESTKL,X           // Get command code from stack (X = ESP from VM) <- WRONG
171:     !byte $FC, $5D            // Print A register (command value)
```

### Suggested Improvements

```asm
152: asm execMegaFlash(cmd)#1
153:     !SOURCE "vmsrc/apple/plvmzp.inc"
154:     !SOURCE "vmsrc/apple/megaflash.inc"
155:
156:     // Enable tracing for entire function execution
157:     !byte $FC, $65, $01
158:
159:     / Trace A: Entry point - got command from stack
160:     !byte $FC, $5C, 'A'
161:
162:     // X points to command parameter (which is also return slot)
163:     // Function signature: execMegaFlash(cmd)#1 - reuses same slot
164:
165:     // DIAGNOSTIC: Print X (stack pointer) at entry
166:     TXA
167:     !byte $FC, $5D
168:
169:     // Get command from stack
170:     LDA     ESTKL,X           // Command byte at stack top
171:
172:     // DIAGNOSTIC: Print command value
173:     !byte $FC, $5D
```

**Lines 162-167 changes:**
- Remove misleading "Save ESP" comment
- Remove "X already contains ESP from VM" (wrong concept)
- Replace with correct explanation of stack slot reuse
- Clarify that X is stack pointer, not ESP

**The rest of the function (lines 172-260):**
- Keep the `STX TMPL` at line 163 (actually is useful for restoring X)
- But add comment: "// Save X to use it later (not for loop counter here)"
- Keep `LDX TMPL` at lines 216, 230, 251 (restores stack pointer)
- These are actually CORRECT (X gets modified by timeout loop logic)

## No Fix Needed #1: waitMegaFlash (Lines 118-148)

This function has no parameters and doesn't use the evaluation stack. It's correct as-is.

```asm
118: asm waitMegaFlash
119:     !SOURCE "vmsrc/apple/plvmzp.inc"
120:     !SOURCE "vmsrc/apple/megaflash.inc"
121:
122:     // Set timeout counter (approximately 65536 iterations)
123:     LDX     #$00
124:     LDY     #$00
```

**Note:** Here `LDX #$00` is correct because it's initializing a loop counter, NOT trying to access the stack.

## No Fix Needed #2: receiveFAC (Lines 369-392)

This function correctly handles the stack.

```asm
369: asm receiveFAC(pResult)#1
370:     // X already contains ESP from VM           <- Could improve comment
371:
372:     // Get pointer
373:     LDA     ESTKL,X                              <- CORRECT: Single param at X
374:     STA     $06
375:     LDA     ESTKH,X
376:     STA     $07
```

**Why this is correct:**
1. Function has 1 parameter and returns 1 value
2. X points to parameter (which becomes return slot)
3. No need to pop - same slot is reused
4. Parameter access uses `ESTKL,X` (direct, not offset)
5. Return value stored at `ESTKL,X` (line 387)

**Optional improvement to line 370:**
```asm
370:     // X points to pResult parameter (reused as return slot)
```

## Summary of Required Changes

### sendFACARG - CRITICAL FIX REQUIRED

**Lines 274-297:** Complete rewrite
- Pop parameters FIRST
- Add `STX ESP`
- Change to backward indexing (`-N` instead of `+N`)
- Fix parameter order

### execMegaFlash - COMMENT IMPROVEMENTS

**Lines 162-170:** Update comments
- Remove "ESP" terminology
- Clarify stack slot reuse
- Explain X is stack pointer, not ESP variable

### waitMegaFlash - NO CHANGES

Already correct.

### receiveFAC - OPTIONAL COMMENT IMPROVEMENT

**Line 370:** Clarify comment
- "X points to pResult parameter (reused as return slot)"

## Testing After Fixes

### Test 1: Verify Stack Pointer Values

Add these diagnostics and verify output:

```asm
// In sendFACARG after fix:
TXA
!byte $FC, $5D    // Should print ~$1C at entry (after 3 pushes)

// After INX×3:
TXA
!byte $FC, $5D    // Should print ~$1F after popping
```

**Expected Jace sysout:**
```
S           (trace: entry to sendFACARG)
$1C         (X at entry = 28)
$1F         (X after popping = 31)
[facExt]    (facExt value printed)
```

### Test 2: Memory Address Verification

Calculate addresses accessed:

```python
# Before fix (WRONG):
X_entry = 0x1C  # After pushing 3 params
addr_pFAC = 0xC0 + 0x1C + 2  # ESTKL+2,X
print(f"pFAC accessed at: ${addr_pFAC:02X}")  # $DE (edge!)

# After fix (CORRECT):
X_after_pop = 0x1F  # After INX×3
addr_pFAC = 0xC0 + 0x1F - 1  # ESTKL-1,X
print(f"pFAC accessed at: ${addr_pFAC:02X}")  # $DE (via correct method!)
```

**Result:** Both access `$DE`, but after fix we use safe backward indexing.

### Test 3: Functional Test

Run fptest_mf.pla and verify:
1. Multiplication works
2. Division works
3. Sine/cosine work
4. No crashes or hangs
5. Results match expected values

## Implementation Steps

1. **Backup current fpumf.pla**
   ```bash
   cp libsrc/fpumf.pla libsrc/fpumf.pla.backup
   ```

2. **Edit sendFACARG function (lines 267-307)**
   - Replace parameter access code as shown above
   - Add diagnostics

3. **Update execMegaFlash comments (lines 162-170)**
   - Improve comment clarity
   - Remove ESP misconceptions

4. **Compile**
   ```bash
   cd /Users/brobert/Documents/code/PLASMA/src
   make
   ```

5. **Test on Jace emulator**
   - Run fptest_mf.pla
   - Check sysout for diagnostic values
   - Verify calculations are correct

6. **If tests pass, remove diagnostic traces**
   - Remove `!byte $FC, $5D` lines
   - Keep functional code

7. **Final compile and integration test**

## Expected Diagnostic Output After Fix

```
S                    <- Trace: entering sendFACARG
1C                   <- X at entry (28 decimal)
1F                   <- X after popping (31 decimal)
05                   <- facExt value (example)
1                    <- Trace: got parameters
2                    <- Trace: buffer reset
3                    <- Trace: loop iteration
05                   <- Y counter (5)
40                   <- FAC[5] byte
...                  <- More loop iterations
9                    <- Trace: sendFACARG complete
```

If you see this output and calculations work correctly, the fix is successful!
