#!/bin/bash
#
# Build PLEIADES full disk image from compiled sources
#
# This script creates a fresh, bootable ProDOS disk image from scratch.
# It copies the blank 32MB disk image, places PRODOS as the first file
# (required for bootability), adds PLASMA.SYSTEM and other system files,
# and places all compiled REL modules in the /SYS/ directory.
#
# Usage:
#   ./build_disk.sh
#
# Output:
#   PLEIADES-MEGAFLASH-FPU.po - Fresh bootable disk image
#

set -e  # Exit immediately if any command fails
set -u  # Exit if undefined variables are used
set -o pipefail  # Exit if any command in a pipeline fails

# Configuration
JAVA_HOME="/opt/homebrew/opt/openjdk"
AC_JAR="/tmp/ac.jar"
BLANK_IMAGE="sysfiles/BLANK32M.po"
OUTPUT_IMAGE="PLEIADES-MEGAFLASH-FPU.po"
JAVA="${JAVA_HOME}/bin/java"

# Build PLASMA programs first - fail fast if compilation errors occur
echo "Building PLASMA programs..."
cd src

# Capture make output and check for errors/warnings
BUILD_OUTPUT=$(make 2>&1)
BUILD_EXIT=$?

# Display the output
echo "$BUILD_OUTPUT"

# Check for compilation failures
if [ $BUILD_EXIT -ne 0 ]; then
    echo "" >&2
    echo "ERROR: Compilation failed! Check errors above." >&2
    echo "Disk image will NOT be built." >&2
    exit 1
fi

# Check for warnings - treat as errors
if echo "$BUILD_OUTPUT" | grep -q "Warning:"; then
    echo "" >&2
    echo "ERROR: Compiler warnings detected (treating as errors)." >&2
    echo "Fix warnings above before building disk image." >&2
    echo "Disk image will NOT be built." >&2
    exit 1
fi

cd ..

# Check prerequisites
if [ ! -f "$BLANK_IMAGE" ]; then
    echo "Error: Blank image not found: $BLANK_IMAGE" >&2
    exit 1
fi

if [ ! -f "$AC_JAR" ]; then
    echo "Error: AppleCommander JAR not found: $AC_JAR" >&2
    exit 1
fi

echo "Building PLEIADES full disk image..."
echo "Output: $OUTPUT_IMAGE"
echo ""

# Remove old image if it exists
if [ -f "$OUTPUT_IMAGE" ]; then
    rm -f "$OUTPUT_IMAGE"
fi

# Copy blank image to output
echo "Copying blank image..."
cp "$BLANK_IMAGE" "$OUTPUT_IMAGE"

# Function to put a file on the disk image
# Usage: put_file <local_path> <prodos_path> <type> [<addr>]
put_file() {
    local local_path="$1"
    local prodos_path="$2"
    local file_type="$3"
    local addr="${4:-}"

    # Strip type suffix from local filename for display
    local display_name=$(basename "$local_path" | sed 's/#[0-9A-F]*$//')

    if [ -n "$addr" ]; then
        cat "$local_path" | "$JAVA" -jar "$AC_JAR" -p "$OUTPUT_IMAGE" "$prodos_path" "$file_type" "$addr"
    else
        cat "$local_path" | "$JAVA" -jar "$AC_JAR" -p "$OUTPUT_IMAGE" "$prodos_path" "$file_type"
    fi

    if [ $? -ne 0 ]; then
        echo "Error: Failed to copy $display_name to $prodos_path" >&2
        exit 1
    fi
}

# Place PRODOS first (required for bootability)
echo "Placing system files (bootable)..."
echo "  PRODOS"
put_file "sysfiles/PRODOS#FF0000" "PRODOS" "SYS" "0x2000"

# Place PLASMA.SYSTEM
echo "  PLASMA.SYSTEM"
put_file "src/rel/apple/PLASMA.SYSTEM#FF2000" "PLASMA.SYSTEM" "SYS" "0x2000"

# Place CMD files in root
echo "  CMD"
put_file "src/rel/apple/CMD#061000" "CMD" "BIN" "0x1000"

echo "  CMD.128"
put_file "src/rel/apple/CMD.128#061000" "CMD.128" "BIN" "0x1000"

# Place PLVM files in root
echo "  PLVM.128"
put_file "src/rel/apple/PLVM.128#FF2000" "PLVM.128" "SYS" "0x2000"

echo "  PLVM16"
put_file "src/rel/apple/PLVM16#FF2000" "PLVM16" "SYS" "0x2000"

# Place SANE CODE files in SYS/ subdirectory (required by SANE module)
echo ""
echo "Placing SANE CODE files in SYS/ subdirectory..."
echo "  FP6502.CODE"
put_file "sysfiles/FP6502.CODE#060000" "SYS/FP6502.CODE" "BIN"
echo "  ELEMS.CODE"
put_file "sysfiles/ELEMS.CODE#060000" "SYS/ELEMS.CODE" "BIN"

# Place REL modules in SYS/ subdirectory
echo ""
echo "Placing REL modules in SYS/ subdirectory..."

# Place DHGR libraries first (required by MANDEL and other DHGR programs)
if [ -f "src/dhgr.tk/libs/DHGRLIB.REL" ]; then
    echo "  DHGRLIB"
    put_file "src/dhgr.tk/libs/DHGRLIB.REL" "SYS/DHGRLIB" "REL"
fi

if [ -f "src/dhgr.tk/libs/DHGRUTILS.REL" ]; then
    echo "  DHGRUTILS"
    put_file "src/dhgr.tk/libs/DHGRUTILS.REL" "SYS/DHGRUTILS" "REL"
fi

echo "Placing REL modules in SYS/ subdirectory..."
# Process all REL files in sorted alphabetical order
# ProDOS maintains insertion order, so files must be added sorted
for file in $(ls -1 src/rel/*\#FE1000 src/rel/apple/*\#FE1000 2>/dev/null | sort); do
    if [ -f "$file" ]; then
        basename=$(basename "$file" | sed -e 's/#FE1000$//' -e 's/#FE1000$//')
        echo "  $basename"
        put_file "$file" "SYS/$basename" "REL"
    fi
done

echo ""
echo "Build complete!"
echo ""
echo "Disk image created: $OUTPUT_IMAGE"
echo ""
echo "To view contents:"
echo "  java -jar $AC_JAR -l $OUTPUT_IMAGE"
echo ""
echo "To view SYS/ subdirectory:"
echo "  java -jar $AC_JAR -ll $OUTPUT_IMAGE | grep -A 999 'SYS DIR'"
