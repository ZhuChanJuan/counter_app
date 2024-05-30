#!/bin/bash
set -e
cd /Users/vickyzhu/FlutterProjects/counter_app/integration_test

# Define the folder containing your test files
# TEST_FOLDER="."

# Find all Dart test files in the specified folder
test_files=$(find . -maxdepth 1 -type f -name "*_test.dart")

# Function to run a single test file
run_test() {
    local test_file=$1
    # echo "Running test: ${test_file#./}"
    test_file=${test_file#./}
    echo "Running test: $test_file"
    flutter drive --driver=integration_test/integration_driver.dart -t integration_test/"$test_file" -d chrome
    if [ $? -ne 0 ]; then
        echo "Test failed: $test_file"
        exit 1
    fi
}

export -f run_test

# Run tests in parallel
echo "$test_files" | parallel -j 5 run_test {}

if [ $? -eq 0 ]; then
    echo "All tests passed!"
else
    echo "Some tests failed."
    exit 1
fi