#!/bin/bash

# Define the folder containing your test files
TEST_FOLDER="integration_test"

# Find all Dart test files in the specified folder
test_files=$(find $TEST_FOLDER -name "*_test.dart")

# Export necessary environment variables for flutter command
export PATH="$PATH:$(flutter sdk-path)/bin"

# Function to run a single test file
run_test() {
    local test_file=$1
    echo "Running test: $test_file"
    flutter drive --target=$test_file
    if [ $? -ne 0 ]; then
        echo "Test failed: $test_file"
        exit 1
    fi
}

export -f run_test

# Run tests in parallel
echo "$test_files" | parallel -j $(nproc) run_test {}

if [ $? -eq 0 ]; then
    echo "All tests passed!"
else
    echo "Some tests failed."
    exit 1
fi