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

# Define the source files and the output binaries
SRC_FILE1="$REPO_DIR/example/testmp.cpp"
SRC_FILE2="$REPO_DIR/example/testmp2.cpp"
OUTPUT1="testmp"
OUTPUT2="testmp2"

# Compile the first source file with OpenMP support
g++ -O0 -std=c++11 -Wall -pedantic -fopenmp -g -march=native -o "$OUTPUT1" "$SRC_FILE1"

# Compile the second source file with OpenMP support
g++ -O0 -std=c++11 -Wall -pedantic -fopenmp -g -march=native -o "$OUTPUT2" "$SRC_FILE2"

echo "BUILD SUCCESSFUL"
