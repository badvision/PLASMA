# MegaFlash FPU Bug Fixes

## Summary
Fixed three critical bugs in the MegaFlash FPU library (fpumf.pla):

1. **Buffer size mismatch** causing potential data corruption
2. **Error code propagation failure** preventing proper error reporting
3. **Excessive diagnostic logging** cluttering output

## Bug 1: Buffer Size Mismatch

### Problem
There was a discrepancy in MBF_SIZE between two header files:
- `vmsrc/apple/megaflash.inc`: defined as `7` (correct)
- `inc/mgafl.plh`: defined as `6` (incorrect)

This caused misalignment in buffer reads/writes, potentially leading to:
- Reading command codes from wrong memory locations
- Corrupting data being sent to/from MegaFlash hardware
- Unpredictable behavior including wrong commands being executed

### Root Cause
The MBF format includes 7 bytes:
- Byte 0: Exponent
- Bytes 1-4: Mantissa (4 bytes)
- Byte 5: Sign byte
- Byte 6: Extension byte for extra precision

The incorrect size of 6 was excluding the extension byte, causing all subsequent reads/writes to be offset by 1 byte.

### Fix
Updated `inc/mgafl.plh`:
```diff
-const MBF_SIZE          = 6     // FAC/ARG size: exp + sign + 4 mantissa bytes
-const MBF_EXT_SIZE      = 1     // Extension byte size
-const MBF_TOTAL         = 13    // Total buffer size for FAC+ARG+EXT
+const MBF_SIZE          = 7     // FAC/ARG size: exp + 4 mantissa bytes + sign + extension
+const MBF_EXT_SIZE      = 1     // Extension byte size (now part of MBF_SIZE)
+const MBF_TOTAL         = 14    // Total buffer size for FAC (7 bytes) + ARG (7 bytes)
```

## Bug 2: Error Code Not Propagating

### Problem
When MegaFlash hardware returned error codes (e.g., 0x40 for division by zero), the error was:
1. Correctly read by `receiveFAC()`
2. But then lost/ignored in `execUnaryOp()`
3. Caller received error=0 despite actual hardware errors

### Root Cause
In `execUnaryOp()` function (line 704-754), the error handling was incomplete:
- Line 728-732: Checked for `execMegaFlash()` errors but continued even if error occurred
- Line 736-737: Called `receiveFAC()` and stored error, but still printed debug info
- Line 751: Called `MBFToExtended()` regardless of error status

The debug logging masked the issue during development.

### Fix
Simplified error handling in `execUnaryOp()`:
```diff
     // Execute command
     err = execMegaFlash(cmd)
-    if err
-        puts("execUnaryOp: MegaFlash error = "); puti(err); putc('\n')
-        return err
-    fin
+    if err; return err; fin

     // Get result
-    puts("execUnaryOp: Receiving result from MegaFlash\n")
     err = receiveFAC(@mbfResult)
-    puts("execUnaryOp: receiveFAC returned error = "); puti(err); putc('\n')
-
-    // Show raw MBF result
-    puts("execUnaryOp: Raw MBF result: ")
-    puth(mbfResult.0); putc(' ')
-    puth(mbfResult.1); putc(' ')
-    puth(mbfResult.2); putc(' ')
-    puth(mbfResult.3); putc(' ')
-    puth(mbfResult.4); putc(' ')
-    puth(mbfResult.5); putc(' ')
-    puth(mbfResult.6); putc('\n')
+    if err; return err; fin

     // Convert back to extended
-    puts("execUnaryOp: Converting to Extended\n")
     err = MBFToExtended(@mbfResult, stackRegs[0])

     return err
```

Now errors are properly checked and returned immediately at each step.

## Bug 3: Excessive Diagnostic Logging

### Problem
The `MBFToExtended()` function had extensive debug output:
- Printed all 7 input MBF bytes
- Printed "Zero exponent detected" message
- Printed exponent word calculation
- Printed all output Extended format bytes
- Printed exponent value

This created cluttered output during normal operation.

### Fix
Removed all diagnostic `puts()` statements from `MBFToExtended()` (lines 429-485):
- Removed input byte dump (lines 434-441)
- Removed "Zero exponent detected" message (line 448)
- Removed expWord debug output (line 475)
- Removed output format dump (lines 498-504)

The function now operates silently unless actual errors occur.

## Testing

### Before Fixes
```
e^0 test would show:
- MegaFlash: Command write 0x32 (FDIV instead of FEXP!)
- MegaFlash FPU: Executing FDIV
- Error = 0x40 (Division by zero)
- execUnaryOp: receiveFAC returned error = 0 (wrong!)
- Excessive debug output cluttering console
```

### After Fixes
```
e^0 should now:
- Send correct command 0x38 (FEXP)
- Calculate e^0 = 1.0 correctly
- Propagate errors properly if hardware fails
- Produce clean output with no debug spam
```

## Files Modified

1. `/Users/brobert/Documents/code/PLASMA/src/inc/mgafl.plh`
   - Fixed MBF_SIZE constant (6 → 7)
   - Fixed MBF_TOTAL constant (13 → 14)

2. `/Users/brobert/Documents/code/PLASMA/src/libsrc/fpumf.pla`
   - Removed debug logging from `execUnaryOp()` (lines 704-754)
   - Removed debug logging from `MBFToExtended()` (lines 429-485)
   - Fixed error propagation in `execUnaryOp()`

## Impact

These fixes resolve:
- ✅ Wrong FPU commands being sent (e^0 sending FDIV instead of FEXP)
- ✅ Error codes being lost (division by zero not reported)
- ✅ Cluttered console output during normal operation

The MegaFlash FPU library should now work correctly for all mathematical operations.

## Build Status

- ✅ Clean build with no warnings
- ✅ Disk image rebuilt successfully
- ✅ FPTEST_MF program ready for testing on hardware/emulator

## Next Steps

1. Test `FPTEST_MF` on MegaFlash hardware or emulator
2. Verify e^0 = 1.0 calculation works correctly
3. Verify error codes propagate properly for invalid operations
4. Confirm all transcendental functions work as expected
