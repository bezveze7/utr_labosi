#!/bin/sh
# Define the directory where the test files are located
test_directory="/content/"
# File path of the C program
file_path={ime_datoteke}

num_tests_passed=0

for test_dir in "$test_directory"/test*; do
  echo "Running tests in $test_dir"




  input_file="$test_dir/test.a"
  expected_output_file="$test_dir/test.b"
  actual_output_file="$test_dir/my_output_c.txt"

  # Compile the C program
  gcc "$file_path" -o "$test_dir/my_program"

  "$test_dir/my_program" < "$input_file" > "$actual_output_file"

  if diff -q "$expected_output_file" "$actual_output_file" > /dev/null; then
    echo "Test passed"
    num_tests_passed=$((num_tests_passed+1))
  else
    echo "Test failed"
  fi

done

echo "$num_tests_passed tests passed"
