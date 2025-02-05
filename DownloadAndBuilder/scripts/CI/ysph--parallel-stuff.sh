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

# Navigate to the directory containing quick_sort.cpp
cd "$REPO_DIR/b_omp"

# Define the source file and the output binary
SRC_FILE="quick_sort.cpp"
OUTPUT="quick_sort"

# Compile the source file with OpenMP support
g++ -o $OUTPUT $SRC_FILE -fopenmp

echo "BUILD SUCCESSFUL"
