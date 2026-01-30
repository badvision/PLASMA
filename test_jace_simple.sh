#!/bin/bash
# Simple JACE test - no complex script, just boot and run

set -x  # Debug output

JACE_DIR="/Users/brobert/Documents/code/jace"
DISK_IMAGE="/Users/brobert/Documents/code/PLASMA/PLEIADES-MEGAFLASH-FPU.po"

cd "$JACE_DIR"

# Try simpler approach: Pass disk via Java system property
# Based on help output showing: s7 -> CardMassStorage

timeout 90 mvn -q exec:java \
  -Dexec.mainClass="jace.terminal.HeadlessTerminal" \
  -Dexec.args="-s7.d1=$DISK_IMAGE" \
  <<'EOF'
run 1000000
key "-/SYS/FPUMF_AUTO_TEST\n"
run 3000000
qq
EOF
