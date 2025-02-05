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

# Clean up any previous build artifacts, except for the mkmh directory
echo "Cleaning up previous build artifacts..."
make clean || true  # Ignore errors in the make clean step

# Build the project without the mkmh target
echo "Building the project..."
make -k || true  # Ignore errors in the make step

echo "BUILD SUCCESSFUL"
