#/bin/sh
cd $1
g++ -fopenmp main.cpp -o main.exe
g++ matmult.cpp -fopenmp  -o matmult.exe
echo "BUILD SUCCESSFUL"
