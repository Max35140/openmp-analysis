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

# Navigate to the repository directory
cd "$REPO_DIR"

# Define the source files excluding the problematic file
SRC_FILES="fib.c"
OUTPUT="output_binary"

# Compile the source files with OpenMP support, ignoring warnings
gcc -o $OUTPUT $SRC_FILES -fopenmp -w

echo "BUILD SUCCESSFUL"
