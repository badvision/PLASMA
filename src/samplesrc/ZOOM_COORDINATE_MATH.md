# Zoom Coordinate Recalculation for Mandelbrot Renderer

## Overview

This document describes the mathematical approach for converting zoom box coordinates (screen space) to complex plane coordinates for the Mandelbrot set renderer.

## Coordinate Systems

### Screen Space (DGR - Double Graphics Resolution)
- X range: 0 to 79 pixels
- Y range: 0 to 47 pixels
- Origin: Top-left corner (0, 0)
- Y increases downward

### Complex Plane Space
- Real axis (horizontal): arbitrary range [realMin, realMax]
- Imaginary axis (vertical): arbitrary range [imagMin, imagMax]
- Standard mathematical convention: imaginary increases upward
- Initial default: typically realMin=-2.5, realMax=1.0, imagMin=-1.0, imagMax=1.0

## Required Function from Agent 1

Agent 3's zoom functionality depends on a coordinate mapping function from Agent 1:

```plasma
// Maps screen pixel coordinates to complex plane coordinates
//
// Parameters:
//   px       - Screen X coordinate (0-79)
//   py       - Screen Y coordinate (0-47)
//   pSettings - Pointer to settings structure containing current complex bounds
//   pReal    - Output: pointer to FPU register for real component
//   pImag    - Output: pointer to FPU register for imaginary component
//
// The settings structure must contain:
//   byte[t_fpureg] realMin
//   byte[t_fpureg] realMax
//   byte[t_fpureg] imagMin
//   byte[t_fpureg] imagMax
//
predef screenToComplex(px, py, pSettings, pReal, pImag)#0
```

## Mathematical Transformation

The transformation from screen coordinates to complex plane is a linear mapping:

### For Real Component (X axis):
```
real = realMin + (px / screenWidth) * (realMax - realMin)
```

### For Imaginary Component (Y axis):
```
// Note: Y axis is inverted (screen Y increases downward, imaginary increases upward)
imag = imagMax - (py / screenHeight) * (imagMax - imagMin)
```

Where:
- `screenWidth` = 79 (maximum X coordinate)
- `screenHeight` = 47 (maximum Y coordinate)

## Implementation in Agent 1

Agent 1 should implement this in their coordinate mapping module:

```plasma
def screenToComplex(px, py, pSettings, pReal, pImag)#0
    byte[t_fpureg] temp, range

    // Load realMin into pReal
    memcpy(pReal, pSettings + OFFSET_REALMIN, t_fpureg)

    // Calculate real component
    // real = realMin + (px / 79) * (realMax - realMin)
    fpu:loadExt(pReal)           // Push realMin
    fpu:loadInt(@px)             // Push px
    fpu:pushInt(79)              // Push screenWidth
    fpu:divXY()                  // px / 79

    // Calculate range: realMax - realMin
    memcpy(@temp, pSettings + OFFSET_REALMAX, t_fpureg)
    fpu:loadExt(@temp)           // Push realMax
    fpu:loadExt(pSettings + OFFSET_REALMIN)  // Push realMin
    fpu:subXY()                  // realMax - realMin
    fpu:storExt(@range)          // Store range

    fpu:loadExt(@range)          // Push range
    fpu:mulXY()                  // (px/79) * range
    fpu:addXY()                  // realMin + result
    fpu:storExt(pReal)           // Store in output

    // Calculate imaginary component (similar process with Y inversion)
    // imag = imagMax - (py / 47) * (imagMax - imagMin)
    fpu:loadExt(pSettings + OFFSET_IMAGMAX)  // Push imagMax
    fpu:loadInt(@py)             // Push py
    fpu:pushInt(47)              // Push screenHeight
    fpu:divXY()                  // py / 47

    // Calculate range: imagMax - imagMin
    memcpy(@temp, pSettings + OFFSET_IMAGMAX, t_fpureg)
    fpu:loadExt(@temp)           // Push imagMax
    fpu:loadExt(pSettings + OFFSET_IMAGMIN)  // Push imagMin
    fpu:subXY()                  // imagMax - imagMin
    fpu:storExt(@range)          // Store range

    fpu:loadExt(@range)          // Push range
    fpu:mulXY()                  // (py/47) * range
    fpu:subXY()                  // imagMax - result
    fpu:storExt(pImag)           // Store in output
end
```

## Zoom Bounds Calculation (Agent 3)

Once Agent 1 provides `screenToComplex()`, Agent 3's `calculateZoomBounds()` uses it:

```plasma
def calculateZoomBounds(pSettings, pNewBounds)#0
    byte[t_fpureg] realMin, imagMin, realMax, imagMax
    word x1, y1, x2, y2

    // Get normalized zoom box corners
    x1 = mouseState:startX
    y1 = mouseState:startY
    x2 = mouseState:lastX
    y2 = mouseState:lastY

    // Ensure proper ordering
    if x1 > x2; swap(x1, x2); fin
    if y1 > y2; swap(y1, y2); fin

    // Convert top-left corner
    screenToComplex(x1, y1, pSettings, @realMin, @imagMin)

    // Convert bottom-right corner
    screenToComplex(x2, y2, pSettings, @realMax, @imagMax)

    // Note: Due to Y inversion, imagMin and imagMax are correctly oriented
    // (imagMin from top of screen, imagMax from bottom)

    // Store in output structure
    memcpy(pNewBounds + 0,  @realMin, t_fpureg)  // New realMin
    memcpy(pNewBounds + 10, @imagMin, t_fpureg)  // New imagMin
    memcpy(pNewBounds + 20, @realMax, t_fpureg)  // New realMax
    memcpy(pNewBounds + 30, @imagMax, t_fpureg)  // New imagMax
end
```

## Integration Points

### Agent 1 Responsibilities:
1. Define the settings structure with complex plane bounds
2. Implement `screenToComplex()` function
3. Export the function signature in mandel.pla

### Agent 3 Responsibilities:
1. ✅ Implement mouse polling and zoom box drawing (COMPLETE)
2. ✅ Implement `calculateZoomBounds()` using Agent 1's function (COMPLETE - in mandel_mouse.pla)
3. ⏳ Test coordinate transformation once Agent 1's function is available
4. ⏳ Verify zoom behavior with actual Mandelbrot rendering

### Agent 2 Responsibilities:
- Integrate zoom trigger into render loop
- Handle re-render when zoom completes
- Coordinate double-buffering with mouse drawing

## Testing Strategy

### Unit Tests (Agent 3):
1. Test known zoom box to expected complex bounds
   - Example: Box (0,0) to (79,47) should map to full current bounds
   - Example: Box (20,12) to (60,36) should map to center region

2. Test edge cases:
   - Single-pixel zoom box (should reject - too small)
   - Full-screen zoom box (no-op - same bounds)
   - Zero-width or zero-height box (reject)

### Integration Tests (All Agents):
1. Zoom into interesting region (e.g., edge of main cardioid)
2. Verify higher detail appears
3. Zoom out (requires undo feature - future work)
4. Rapid zoom sequence (stress test)

## Future Enhancements

1. **Zoom History Stack**: Allow undo/redo of zoom operations
2. **Animated Zoom**: Smoothly interpolate between old and new bounds
3. **Center-Point Zoom**: Alternative to box zoom - click center, use mouse wheel for scale
4. **Keyboard Zoom**: Arrow keys to pan, +/- to zoom in/out
5. **Zoom Aspect Ratio Lock**: Maintain specific aspect ratio during zoom

## Appendix: Screen-to-Complex Examples

Given initial bounds:
- realMin = -2.0
- realMax = 1.0
- imagMin = -1.0
- imagMax = 1.0

### Example 1: Center of screen
- Screen: (39, 23) - approximately center
- Real: -2.0 + (39/79) * (1.0 - (-2.0)) = -2.0 + 0.494 * 3.0 = -0.518
- Imag: 1.0 - (23/47) * (1.0 - (-1.0)) = 1.0 - 0.489 * 2.0 = 0.021
- Complex: approximately -0.5 + 0.02i (near main cardioid center)

### Example 2: Top-left corner
- Screen: (0, 0)
- Real: -2.0 + (0/79) * 3.0 = -2.0
- Imag: 1.0 - (0/47) * 2.0 = 1.0
- Complex: -2.0 + 1.0i ✓

### Example 3: Bottom-right corner
- Screen: (79, 47)
- Real: -2.0 + (79/79) * 3.0 = 1.0
- Imag: 1.0 - (47/47) * 2.0 = -1.0
- Complex: 1.0 - 1.0i ✓

## Status

- ✅ Math documented
- ✅ Function interface specified for Agent 1
- ✅ Implementation guidance provided
- ⏳ Waiting on Agent 1 to implement screenToComplex()
- ⏳ Integration testing blocked until function available
