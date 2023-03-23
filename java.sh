#! /bin/sh

# Define the directory where the test files are located
test_directory="/content/"
# file path of the Java program
java_file_path="SimEnka.java"


num_tests_passed=0


for test_dir in "$test_directory"/test*; do
  echo "Running tests in $test_dir"


  input_file="$test_dir/test.a"
  expected_output_file="$test_dir/test.b"
  actual_output_file="$test_dir/my_java_output.txt"


  java "$java_file_path" < "$input_file" > "$actual_output_file"


  if diff -q "$expected_output_file" "$actual_output_file" > /dev/null; then
    echo "Test passed"
    num_tests_passed=$((num_tests_passed+1))
  else
    echo "Test failed"
  fi
done


echo "$num_tests_passed tests passed"
