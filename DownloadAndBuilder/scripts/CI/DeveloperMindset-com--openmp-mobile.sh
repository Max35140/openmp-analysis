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

# Define the source file and the output binary
SRC_FILE="$REPO_DIR/openmp/tools/archer/tests/races/task-two.c"
OUTPUT="task_two"

# Compile the source file with OpenMP support
gcc -O0 -std=c99 -Wall -pedantic -fopenmp -g -o "$OUTPUT" "$SRC_FILE"

echo "BUILD SUCCESSFUL"
