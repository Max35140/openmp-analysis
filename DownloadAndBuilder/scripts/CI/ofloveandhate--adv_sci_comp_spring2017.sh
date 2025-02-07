#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if the repository directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <repository-directory>"
    exit 1
fi

# Get the repository directory from the argument
REPO_DIR="$1"

# Temporary directory for modified files
TMP_DIR=$(mktemp -d)

# Function to clean up temporary directory on exit
cleanup() {
    rm -rf "$TMP_DIR"
}
trap cleanup EXIT

# Copy the files to the temporary directory and modify them
cp "$REPO_DIR/openmp/tasks/tasks.cpp" "$TMP_DIR/tasks.cpp"
cp "$REPO_DIR/openmp/tasks/sum_parallel.cpp" "$TMP_DIR/sum_parallel.cpp"

# Replace "10'000'000" with "10000000" in sum_parallel.cpp
sed -i "s/10'000'000/10000000/g" "$TMP_DIR/sum_parallel.cpp"

# Define the source files and the output binaries
SRC_FILE1="$TMP_DIR/tasks.cpp"
SRC_FILE2="$TMP_DIR/sum_parallel.cpp"
OUTPUT1="tasks"
OUTPUT2="sum_parallel"

# Compile the first source file with OpenMP support
g++ -O0 -std=c++11 -Wall -pedantic -fopenmp -g -march=native -o "$OUTPUT1" "$SRC_FILE1"

# Compile the second source file with OpenMP support
g++ -O0 -std=c++11 -Wall -pedantic -fopenmp -g -march=native -o "$OUTPUT2" "$SRC_FILE2"

echo "BUILD SUCCESSFUL"
