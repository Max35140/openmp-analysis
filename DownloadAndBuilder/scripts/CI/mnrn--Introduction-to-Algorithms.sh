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

# Navigate to the directory containing fib.cpp
cd "$REPO_DIR/MultiThreaded/Fib/C++"

# Define the source file and the output binary
SRC_FILE="fib.cpp"
OUTPUT="fib"

# Compile the source file with OpenMP support
g++ -o $OUTPUT $SRC_FILE -fopenmp

echo "BUILD SUCCESSFUL"
