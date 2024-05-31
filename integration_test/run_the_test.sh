#!/bin/bash

# Get the directory of the shell script
script_dir=$(dirname "$0")
echo ">>> current path : '$script_dir'"

# Check if the test file parameter is provided
if [ $# -eq 0 ]; then
  echo "Error: Test file parameter not provided."
  exit 1
fi

# Get the test file path
test_file="$1"

# Check if the test file exists in the integration_test directory
if [ ! -f "$test_file" ]; then
  echo "Error: Test file '$test_file' not found in the integration_test directory."
  exit 1
fi

# # Change directory to integration_test
# cd integration_test || exit 1

# Execute the flutter drive command
flutter drive --driver=integration_test/integration_driver.dart -t integration_test/"$test_file" -d chrome
