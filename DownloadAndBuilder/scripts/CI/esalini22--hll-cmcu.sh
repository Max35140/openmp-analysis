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

# Define the directory containing the Makefile
MAKEFILE_DIR="$REPO_DIR"

# Change to the directory containing the Makefile
cd "$MAKEFILE_DIR"

# Run make to build the project with additional include paths
make CXXFLAGS="-include cstdint" CPPFLAGS="-include cstdint" CFLAGS="-include cstdint"

echo "BUILD SUCCESSFUL"
