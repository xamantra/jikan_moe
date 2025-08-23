#!/bin/bash

# Test Starter Script for Jikan Moe
# This script finds and runs all test files in the test/ directory and its subdirectories

echo "🧪 Starting Jikan Moe Test Suite"
echo "=================================="

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Change to project root directory
cd "$PROJECT_ROOT"

# Check if dart is available
if ! command -v dart &> /dev/null; then
    echo "❌ Error: Dart is not installed or not in PATH"
    exit 1
fi

# Find all test files recursively
echo "🔍 Finding test files..."
TEST_FILES=$(find test/ -name "*.dart" -type f | grep -E "(test|spec)\.dart$" || true)

if [ -z "$TEST_FILES" ]; then
    echo "⚠️  No test files found in test/ directory"
    exit 0
fi

echo "📋 Found test files:"
echo "$TEST_FILES" | sed 's/^/  - /'

echo ""
echo "🚀 Running tests sequentially..."
echo "================================"

# Counter for test results
PASSED=0
FAILED=0

# Run each test file individually
for test_file in $TEST_FILES; do
    echo ""
    echo "📝 Running: $test_file"
    echo "----------------------------------------"
    
    if dart test "$test_file"; then
        echo "✅ PASSED: $test_file"
        ((PASSED++))
    else
        echo "❌ FAILED: $test_file"
        ((FAILED++))
    fi
done

echo ""
echo "📊 Test Results Summary"
echo "======================="
echo "✅ Passed: $PASSED"
echo "❌ Failed: $FAILED"
echo "📋 Total: $((PASSED + FAILED))"

if [ $FAILED -eq 0 ]; then
    echo ""
    echo "🎉 All tests passed!"
else
    echo ""
    echo "⚠️  Some tests failed. Please check the output above."
    exit 1
fi

echo ""
echo "✅ Test suite completed!"
