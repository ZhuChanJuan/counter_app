#!/bin/bash

# Specify the tag to filter
TAG=$1

# Check if the test file parameter is provided
if [ $# -eq 0 ]; then
  echo "Error: Please send tag like './run_tests_with_tag.sh tag1'"
  exit 1
fi

# Generate test files using build_runner
cd ..
dart run build_runner build --delete-conflicting-outputs
cd integration_test

# Find and run all *_test.dart files in the root folder using flutter drive, then Run the tests with the specified tag
# # Important issue : we can't run the test case on "Chrome"
# for test_file in $(find . -maxdepth 1 -type f -name "*_test.dart"); do
#     test_file=${test_file#./}
#     echo "Running test: $test_file"
#     flutter test "$test_file" --tags $TAG -d macos
# done

# Run the custom test runner with the tag
# if [ -z "$TAG" ]; then
#   dart custom_test_runner.dart
# else
  TAG=$TAG FILENAME="temp_filtered_tag_runner.dart" dart custom_test_runner.dart 
# fi

flutter drive --driver=integration_test/integration_driver.dart -t integration_test/temp_filtered_tag_runner.dart -d chrome
