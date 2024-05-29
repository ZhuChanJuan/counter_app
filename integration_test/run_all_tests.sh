#!/bin/bash

# Define the folder containing your test files
TEST_FOLDER="homepage"
# TEST_FOLDER="."

# Define the feature file to be executed first (if the file not in the TEST_FOLDER, then we need change script)
# FEATURE_FILE="login_test_test.dart"
# Define the test files
first_file="login_test_test.dart"

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

# Find all Dart test files in the specified folder
all_test_files=$(find $TEST_FOLDER -name "*_test.dart")

# Execute the feature file first
feature_file_path="$TEST_FOLDER/$first_file"
if [ -f "$feature_file_path" ]; then
    echo "Adding feature file: $feature_file_path"
    target_option=" --target=integration_test/$feature_file_path"
fi

# Append remaining test files to the list
for test_file in $all_test_files
do
    # Skip login_test_test.dart since it's already added
    if [ "$test_file" == "$feature_file_path" ]; then
        continue
    fi

    # Append the test file to the list
    target_option+=" --target=integration_test/$test_file"
done


# Execute the flutter drive command with the constructed --target option
echo "Running tests: $target_option"
cd ..
flutter drive --driver=integration_test/integration_driver.dart $target_option -d chrome
if [ $? -ne 0 ]; then
    echo "Tests failed."
    exit 1
fi

echo "All tests passed!"