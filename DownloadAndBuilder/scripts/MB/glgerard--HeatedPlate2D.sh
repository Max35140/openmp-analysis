#!/bin/bash
# Missing  <bsd/string.h>
cd $1/src
g++ GaussSeidel.c HeatedPlate2D.c HeatedPlate2D.h InitGrid.c Jacobi.c RedBlack_GaussSeidel.c -fpermissive -o
echo "FAIL"

