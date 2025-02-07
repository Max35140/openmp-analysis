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
SRC_FILE1="$REPO_DIR/test5.c"
OUTPUT1="test5"

# Compile the source file
gcc -O0 -std=c99 -Wall -pedantic -g -march=native -o "$OUTPUT1" "$SRC_FILE1" -lm

echo "BUILD SUCCESSFUL"
