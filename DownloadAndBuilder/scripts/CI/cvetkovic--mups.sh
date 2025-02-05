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
SRC_FILE1="$REPO_DIR/dz1/za_predaju/dz1z3.c"
SRC_FILE2="$REPO_DIR/dz1/z3/dz1_z3.c"
OUTPUT1="dz1z3"
OUTPUT2="dz1_z3"

# Compile the first source file with OpenMP support
gcc -o $OUTPUT1 $SRC_FILE1 -fopenmp

# Compile the second source file with OpenMP support
gcc -o $OUTPUT2 $SRC_FILE2 -fopenmp

echo "BUILD SUCCESSFUL"
