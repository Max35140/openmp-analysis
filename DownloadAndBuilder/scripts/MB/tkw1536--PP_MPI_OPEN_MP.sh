#!/bin/sh
cd $1/openmp_1
make
cd $1/openmp_3
make
echo "BUILD SUCCESSFUL"
