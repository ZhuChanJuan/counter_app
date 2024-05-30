#!/bin/bash

set -e
cd /Users/vickyzhu/FlutterProjects/counter_app/integration_test
# Define the folder containing your test files
# TEST_FOLDER="homepage"
# TEST_FOLDER="."


# # Check if the test folder is provided
# if [ -z "$TEST_FOLDER" ]; then
#     echo "Error: Test folder not specified."
#     exit 1
# fi

# # Check if the test folder exists
# if [ ! -d "$TEST_FOLDER" ]; then
#     echo "Error: Test folder '$TEST_FOLDER' does not exist."
#     exit 1
# fi


# Find and run all *_test.dart files in the root folder using flutter drive
for test_file in $(find . -maxdepth 1 -type f -name "*_test.dart"); do
    test_file=${test_file#./}
    echo "Running test: $test_file"
    flutter drive --driver=integration_test/integration_driver.dart -t integration_test/"$test_file" -d chrome
done

echo "All tests passed!"