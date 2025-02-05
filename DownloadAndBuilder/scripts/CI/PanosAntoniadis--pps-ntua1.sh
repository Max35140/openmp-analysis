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

# Navigate to the directory containing the Makefile
cd "$REPO_DIR/Lab1/ex2/parallel/OpenMP"

# List files in the current directory for verification
echo "Listing files in the current directory:"
ls -l

# Clean up any previous build artifacts
echo "Cleaning up previous build artifacts..."
make clean || true  # Ignore errors in the make clean step

# Check if the necessary source files exist
if [ ! -f "util.c" ]; then
    echo "Error: util.c not found in the current directory."
    exit 1
fi

if [ ! -f "fwt_tasks.c" ]; then
    echo "Error: fwt_tasks.c not found in the current directory."
    exit 1
fi

# Compile util.c
echo "Compiling util.c..."
gcc -c util.c -o util.o

# Compile fwt_tasks.c
echo "Compiling fwt_tasks.c..."
gcc -c fwt_tasks.c -o fwt_tasks.o

# Build the project
echo "Building the project..."
make

echo "BUILD SUCCESS