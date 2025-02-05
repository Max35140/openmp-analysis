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
cd "$REPO_DIR/source code"

# Clean up any previous build artifacts
echo "Cleaning up previous build artifacts..."
make clean

# Build the project
echo "Building the project..."
make

echo "BUILD SUCCESSFUL"
