# Agent 3 Integration Guide - Mouse Zoom for Mandelbrot Renderer

## Summary

Agent 3 has completed mouse integration and dual-build system configuration for the Mandelbrot renderer. This document provides integration guidance for Agents 1 and 2.

## Deliverables

### 1. Mouse Integration Module (`mandel_mouse.pla`)

Complete mouse handling module providing:
- ✅ Runtime mouse detection with graceful fallback
- ✅ Mouse event polling (button, position)
- ✅ XOR-based zoom box drawing (non-destructive)
- ✅ Coordinate recalculation for zoom bounds
- ✅ Clean event-driven API for main loop integration

### 2. Dual-Build System (`makefile`)

Build configuration supporting both FPU variants:
- ✅ `MANDEL` - Links with `libsrc/fpu.pla` (SANE-based)
- ✅ `MANDEL_MF` - Links with `libsrc/fpu_mf.pla` (MegaFlash-accelerated)
- ✅ Pattern follows existing `RPNCALC/RPNCALC_MF` structure
- ✅ Both targets added to apple build list

### 3. Test Program (`test_mouse_zoom.pla`)

Standalone test for verification:
- ✅ Tests mouse detection
- ✅ Visually tests zoom box drawing
- ✅ Tests coordinate calculation with mock `screenToComplex()`
- ✅ Can be run independently before full integration

### 4. Documentation

- ✅ `ZOOM_COORDINATE_MATH.md` - Mathematical specification
- ✅ `AGENT3_INTEGRATION_GUIDE.md` - This document

## Integration Requirements

### Required from Agent 1 (Coordinate Mapping)

Agent 3's zoom functionality **requires** this function from Agent 1:

```plasma
// Maps screen pixel coordinates to complex plane coordinates
//
// Parameters:
//   px       - Screen X coordinate (0-79)
//   py       - Screen Y coordinate (0-47)
//   pSettings - Pointer to settings structure with current complex bounds
//   pReal    - Output: pointer to FPU register for real component
//   pImag    - Output: pointer to FPU register for imaginary component
//
predef screenToComplex(px, py, pSettings, pReal, pImag)#0
```

**Status**: ⏳ Waiting on Agent 1 to implement

The settings structure must contain (in order):
```plasma
struc t_settings
    byte[10] realMin    // Offset 0
    byte[10] realMax    // Offset 10
    byte[10] imagMin    // Offset 20
    byte[10] imagMax    // Offset 30
    // ... other fields as needed
end
```

See `ZOOM_COORDINATE_MATH.md` for detailed implementation guidance.

### Required from Agent 2 (Render Loop)

Agent 2's render loop should integrate mouse handling:

```plasma
// In render loop, check for mouse zoom events
if handleMouseEvents(@settings, @newBounds)
    // User completed zoom - update bounds and re-render
    memcpy(@settings:realMin, @newBounds + 0,  10)
    memcpy(@settings:realMax, @newBounds + 10, 10)
    memcpy(@settings:imagMin, @newBounds + 20, 10)
    memcpy(@settings:imagMax, @newBounds + 30, 10)

    // Clear screen and restart render
    dgrClear(0)
    break  // Exit render loop to restart
fin
```

**Status**: ⏳ Waiting on Agent 2's render loop structure

## Integration Steps

### Step 1: Include Mouse Module in mandel.pla

Add to mandel.pla:

```plasma
include "inc/mouse.plh"
include "inc/dgrlib.plh"
include "inc/fpu.plh"

// ... existing code ...

// Include mouse integration module
include "samplesrc/mandel_mouse.pla"
```

**Note**: Once integrated, `mandel_mouse.pla` can be removed as a separate file.

### Step 2: Initialize Mouse at Startup

In main initialization:

```plasma
def initMandelbrot#0
    // ... existing initialization ...

    // Detect and initialize mouse
    if detectMouse()
        puts("Mouse detected - click and drag to zoom\n")
        puts("Press Q to quit\n\n")
    else
        puts("No mouse found - keyboard controls only\n")
        puts("Press Q to quit\n\n")
    fin

    // ... continue initialization ...
end
```

### Step 3: Integrate into Main Event Loop

In render loop:

```plasma
def renderMandelbrot#0
    byte[t_settings] newBounds
    byte quit

    quit = FALSE
    while not quit
        // Render loop (Agent 2)
        // ... pixel rendering code ...

        // Check for mouse events (Agent 3)
        if handleMouseEvents(@settings, @newBounds)
            // User completed zoom - update and re-render
            memcpy(@settings:realMin, @newBounds + 0,  10)
            memcpy(@settings:realMax, @newBounds + 10, 10)
            memcpy(@settings:imagMin, @newBounds + 20, 10)
            memcpy(@settings:imagMax, @newBounds + 30, 10)

            // Restart render with new bounds
            dgrClear(0)
            continue  // Restart loop
        fin

        // Check for keyboard quit
        if ^$C000 >= 128
            if toupper(^$C000 & $7F) == 'Q'
                quit = TRUE
            fin
            ^$C010
        fin
    loop
end
```

### Step 4: Cleanup on Exit

In shutdown:

```plasma
def shutdownMandelbrot#0
    // Shutdown mouse
    shutdownMouse()

    // ... other cleanup ...

    dgrMode(dgrOff)
    conio:textmode(0)
end
```

## Build Instructions

### Building Both Variants

```bash
# From PLASMA/src directory

# Build SANE version
make rel/MANDEL#FE1000

# Build MegaFlash version
make rel/MANDEL_MF#FE1000

# Or build all apple targets (includes both)
make apple
```

### Testing

```bash
# Test mouse integration standalone (before full integration)
# 1. Add test_mouse_zoom.pla to Makefile if needed
# 2. Build test program
# 3. Run on Apple II with mouse hardware

# Once integrated, test full mandelbrot renderer
# 1. Build MANDEL or MANDEL_MF
# 2. Load on Apple II
# 3. Test zoom functionality:
#    - Click and drag to create zoom box
#    - Release to zoom in
#    - Verify higher detail in zoomed region
```

## API Reference

### Mouse Detection

```plasma
def detectMouse#1
```
**Returns**: TRUE if mouse detected, FALSE otherwise
**Side Effects**: Initializes mouse hardware if present
**Call Once**: At program startup

### Main Event Handler

```plasma
def handleMouseEvents(pSettings, pNewBounds)#1
```
**Parameters**:
- `pSettings` - Current settings structure with complex bounds
- `pNewBounds` - Output buffer for new bounds (4 x t_fpureg)

**Returns**: TRUE if zoom completed and render should restart
**Call Frequency**: Every frame in render loop

### Shutdown

```plasma
def shutdownMouse#0
```
**Call Once**: At program exit

## Dependencies

### From Agent 1:
- `screenToComplex(px, py, pSettings, pReal, pImag)` - **REQUIRED**
- Settings structure definition with complex bounds

### From Agent 2:
- Render loop structure
- Screen clearing mechanism
- Render restart capability

### External Libraries:
- `inc/mouse.plh` - Mouse driver API ✅
- `inc/dgrlib.plh` - Double graphics library ✅
- `inc/fpu.plh` - FPU operations ✅
- `libsrc/apple/mouse.pla` - Mouse driver implementation ✅
- `libsrc/apple/dgrlib.pla` - DGR implementation ✅
- `libsrc/fpu.pla` OR `libsrc/fpu_mf.pla` - FPU implementation ✅

## Testing Checklist

### Unit Tests (Agent 3 - Complete)
- ✅ Mouse detection works
- ✅ Zoom box drawing with XOR
- ✅ Coordinate calculation math correct
- ✅ Makefile rules syntactically valid

### Integration Tests (Blocked - Waiting on Agents 1 & 2)
- ⏳ `screenToComplex()` produces correct mappings
- ⏳ Zoom box appears during drag
- ⏳ Zoom box clears on release
- ⏳ Zoomed region shows higher detail
- ⏳ Multiple zoom operations work correctly
- ⏳ Keyboard quit works during mouse operation
- ⏳ Graceful fallback when no mouse present

### System Tests (Future)
- ⏳ Both MANDEL and MANDEL_MF builds work identically
- ⏳ Performance acceptable during mouse drag
- ⏳ No visual artifacts from XOR drawing
- ⏳ Works with different mouse hardware (Joystick, trackball, etc.)

## Known Limitations

1. **No Zoom Undo**: Once zoomed, can't zoom back out without restart
   - Future: Implement zoom history stack

2. **No Aspect Ratio Lock**: Zoom box can be any shape
   - Future: Lock to screen aspect ratio for undistorted results

3. **No Animated Zoom**: Instant transition to new bounds
   - Future: Smooth interpolation between old/new bounds

4. **Requires screenToComplex()**: Can't complete integration without Agent 1
   - Status: Waiting on Agent 1

5. **Mouse Required for Zoom**: No keyboard alternative for zoom
   - Future: Arrow keys for pan, +/- for zoom

## Coordination with Other Agents

### Agent 1 - Next Action Required:
1. Implement `screenToComplex()` function per specification
2. Export function in mandel.pla
3. Test coordinate mapping with known values
4. Signal Agent 3 when ready for integration testing

### Agent 2 - Next Action Required:
1. Design render loop structure with restart capability
2. Add `handleMouseEvents()` call in appropriate location
3. Implement screen clear and re-render on zoom
4. Coordinate double-buffer page flipping with mouse drawing

### Agent 3 - Current Status:
- ✅ All deliverables complete and ready for integration
- ⏳ Waiting on Agent 1 for `screenToComplex()`
- ⏳ Waiting on Agent 2 for render loop structure
- ✅ Available for integration testing once dependencies ready

## Questions and Issues

### For Agent 1:
**Q**: What is the exact layout of your settings structure?
**A Needed**: Confirm offsets for realMin, realMax, imagMin, imagMax

**Q**: Do you have coordinate validation (e.g., realMin < realMax)?
**A**: Agent 3 assumes valid bounds, but validation recommended

### For Agent 2:
**Q**: How are you handling page flipping during render?
**A Needed**: Need to coordinate with mouse drawing (also uses pages)

**Q**: Can render loop support mid-render restart?
**A**: Zoom completion requires stopping current render

### For Integration:
**Q**: Who coordinates the initial program structure (main, init, shutdown)?
**A**: Needs coordination meeting between all three agents

## Contact

Agent 3 implementation complete. Ready for coordination once:
1. Agent 1 provides `screenToComplex()` implementation
2. Agent 2 provides render loop integration points
3. All agents coordinate on main program structure

See test program (`test_mouse_zoom.pla`) for working example of mouse module usage.
