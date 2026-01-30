#!/bin/bash
#
# PLASMA FPU Test Runner (MVP)
# Automated testing for MegaFlash FPU library using JACE emulator
#
# Usage:
#   ./test_runner.sh                    # Run all tests
#   ./test_runner.sh --verbose          # Show detailed output
#   ./test_runner.sh --skip-build       # Skip compilation
#   ./test_runner.sh --help             # Show help
#
# Exit codes:
#   0 - All tests passed
#   1 - Tests failed
#   2 - Build failed
#   3 - Emulator error
#

set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Configuration
JACE_DIR="/Users/brobert/Documents/code/jace"
PLASMA_DIR="/Users/brobert/Documents/code/PLASMA"
DISK_IMAGE="$PLASMA_DIR/PLEIADES-MEGAFLASH-FPU.po"
LOG_DIR="$PLASMA_DIR/test-results"
LOG_FILE="$LOG_DIR/test_$(date +%Y%m%d_%H%M%S).log"

# Flags
VERBOSE=false
SKIP_BUILD=false

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --verbose|-v)
            VERBOSE=true
            shift
            ;;
        --skip-build|-s)
            SKIP_BUILD=true
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --verbose, -v      Show detailed output"
            echo "  --skip-build, -s   Skip compilation and disk build"
            echo "  --help, -h         Show this help"
            echo ""
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Create log directory if needed
mkdir -p "$LOG_DIR"

# Helper functions
print_header() {
    echo -e "${BLUE}===================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}===================================${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Check prerequisites
check_prerequisites() {
    if [ ! -d "$JACE_DIR" ]; then
        print_error "JACE directory not found: $JACE_DIR"
        exit 3
    fi

    if [ ! -d "$PLASMA_DIR/src" ]; then
        print_error "PLASMA source directory not found: $PLASMA_DIR/src"
        exit 2
    fi

    if ! command -v mvn &> /dev/null; then
        print_error "Maven not found. Please install Maven to run JACE."
        exit 3
    fi

    if ! command -v make &> /dev/null; then
        print_error "Make not found. Please install build tools."
        exit 2
    fi
}

# Build PLASMA programs
build_plasma() {
    print_header "Building PLASMA"

    cd "$PLASMA_DIR/src"

    print_info "Cleaning previous build..."
    if $VERBOSE; then
        make clean
    else
        make clean > /dev/null 2>&1
    fi

    print_info "Compiling PLASMA programs..."
    if $VERBOSE; then
        make
    else
        if ! make > /dev/null 2>&1; then
            print_error "Build failed! Check compilation errors."
            exit 2
        fi
    fi

    print_success "Build complete"
}

# Build disk image
build_disk() {
    print_header "Building Disk Image"

    cd "$PLASMA_DIR"

    print_info "Creating bootable disk image..."
    if $VERBOSE; then
        bash build_disk.sh
    else
        if ! bash build_disk.sh > /dev/null 2>&1; then
            print_error "Disk build failed!"
            exit 2
        fi
    fi

    if [ ! -f "$DISK_IMAGE" ]; then
        print_error "Disk image not created: $DISK_IMAGE"
        exit 2
    fi

    print_success "Disk image ready: $DISK_IMAGE"
}

# Run tests in JACE emulator
run_tests() {
    print_header "Running Tests in JACE Emulator"

    print_info "Starting JACE in headless mode..."
    print_info "Test output will be saved to: $LOG_FILE"

    cd "$JACE_DIR"

    # Create JACE test script
    # Use 'run' command to step CPU by cycles instead of sleep
    local test_script=$(cat <<'EOF'
run 500000
key "-/SYS/FPUMF_AUTO_TEST\n"
run 2000000
qq
EOF
)

    # Run JACE with disk specified via command-line args
    print_info "Booting ProDOS and running FPUMF_AUTO_TEST..."

    if $VERBOSE; then
        echo "$test_script" | \
            timeout 60 mvn -q exec:java \
            -Dexec.mainClass="jace.terminal.HeadlessTerminal" \
            -Dexec.args="--s7.d1=$DISK_IMAGE" \
            2>&1 | tee "$LOG_FILE"
    else
        echo "$test_script" | \
            timeout 60 mvn -q exec:java \
            -Dexec.mainClass="jace.terminal.HeadlessTerminal" \
            -Dexec.args="--s7.d1=$DISK_IMAGE" \
            > "$LOG_FILE" 2>&1
    fi

    local exit_code=$?

    if [ $exit_code -eq 124 ]; then
        print_error "Test execution timed out (60 seconds)"
        return 3
    elif [ $exit_code -ne 0 ]; then
        print_error "JACE exited with error code: $exit_code"
        return 3
    fi

    print_success "Test execution complete"
    return 0
}

# Analyze test results
analyze_results() {
    print_header "Analyzing Test Results"

    if [ ! -f "$LOG_FILE" ]; then
        print_error "Log file not found: $LOG_FILE"
        return 1
    fi

    # Count test results
    local passed=$(grep -c "PASS" "$LOG_FILE" || true)
    local failed=$(grep -c "FAIL" "$LOG_FILE" || true)
    local errors=$(grep -c "ERROR" "$LOG_FILE" || true)

    print_info "Tests passed: $passed"
    print_info "Tests failed: $failed"
    print_info "Errors: $errors"

    echo ""

    # Check for success indicators
    if grep -q "All tests PASSED\|TEST SUITE PASSED\|SUCCESS" "$LOG_FILE"; then
        print_success "TEST SUITE PASSED"
        echo ""
        echo "Summary:"
        echo "  Passed: $passed"
        echo "  Failed: $failed"
        echo ""
        print_info "Full log: $LOG_FILE"
        return 0
    fi

    # Check for failure indicators
    if grep -qi "FAIL\|ERROR" "$LOG_FILE"; then
        print_error "TEST SUITE FAILED"
        echo ""
        echo "Failed tests:"
        grep -i "fail\|error" "$LOG_FILE" | head -10
        echo ""
        print_info "Full log: $LOG_FILE"
        return 1
    fi

    # Uncertain result
    print_warning "Unable to determine test results"
    print_info "The test may have run but output format was unexpected."
    print_info "Check log manually: $LOG_FILE"
    return 2
}

# Main execution
main() {
    print_header "PLASMA FPU Test Runner"
    echo "Started: $(date)"
    echo ""

    # Check prerequisites
    check_prerequisites

    # Build phase
    if $SKIP_BUILD; then
        print_warning "Skipping build (--skip-build)"
    else
        build_plasma
        echo ""
        build_disk
        echo ""
    fi

    # Test phase
    if ! run_tests; then
        print_error "Test execution failed"
        exit 3
    fi

    echo ""

    # Analysis phase
    if analyze_results; then
        echo ""
        print_success "🎉 All tests passed!"
        exit 0
    else
        exit_code=$?
        echo ""
        print_error "Tests did not pass"
        exit $exit_code
    fi
}

# Run main function
main
