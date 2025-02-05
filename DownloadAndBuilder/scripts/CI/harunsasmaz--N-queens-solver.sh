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
cd "$REPO_DIR"

# Modify the Makefile to replace `icc` with `gcc` and `-qopenmp` with `-fopenmp`
sed -i 's/icc/gcc/g' Makefile

# Modify the `arch` file to replace `icc` with `gcc` and `-qopenmp` with `-fopenmp`
sed -i 's/icc/gcc/g' arch
sed -i 's/-qopenmp/-fopenmp/g' arch

# Clean up any previous build artifacts
echo "Cleaning up previous build artifacts..."
make clean

# Print the modified Makefile and arch file for verification
echo "Modified Makefile:"
cat Makefile

echo "Modified arch file:"
cat arch

# Build the project
echo "Building the project..."
make

echo "BUILD SUCCESSFUL"
