#!/bin/bash

module load cmake
cd $1; sh bootstrap.sh &&\
echo "BUILD SUCCESSFUL"
if [ $? -ne 0 ]; then
    echo "FAIL"
fi
