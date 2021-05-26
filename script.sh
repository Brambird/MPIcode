#!/usr/bin/env bash

#SBATCH -p csedu
#SBATCH -n 16

mpicc -DMPI -O3 -march=native -o prog relax-newz.c -lm

#1 ranks
mpirun -n 1 ./prog 500 10
mpirun -n 1 ./prog 500 10
mpirun -n 1 ./prog 500 10
mpirun -n 1 ./prog 500 10
mpirun -n 1 ./prog 500 10

mpirun -n 1 ./prog 1000 10
mpirun -n 1 ./prog 1000 10
mpirun -n 1 ./prog 1000 10
mpirun -n 1 ./prog 1000 10
mpirun -n 1 ./prog 1000 10

mpirun -n 1 ./prog 5000 10
mpirun -n 1 ./prog 5000 10
mpirun -n 1 ./prog 5000 10
mpirun -n 1 ./prog 5000 10
mpirun -n 1 ./prog 5000 10

mpirun -n 1 ./prog 10000 10
mpirun -n 1 ./prog 10000 10
mpirun -n 1 ./prog 10000 10
mpirun -n 1 ./prog 10000 10
mpirun -n 1 ./prog 10000 10

mpirun -n 1 ./prog 15000 10
mpirun -n 1 ./prog 15000 10
mpirun -n 1 ./prog 15000 10
mpirun -n 1 ./prog 15000 10
mpirun -n 1 ./prog 15000 10

mpirun -n 1 ./prog 25000 10
mpirun -n 1 ./prog 25000 10
mpirun -n 1 ./prog 25000 10
mpirun -n 1 ./prog 25000 10
mpirun -n 1 ./prog 25000 10

#2 ranks
mpirun -n 2 ./prog 500 10
mpirun -n 2 ./prog 500 10
mpirun -n 2 ./prog 500 10
mpirun -n 2 ./prog 500 10
mpirun -n 2 ./prog 500 10

mpirun -n 2 ./prog 1000 10
mpirun -n 2 ./prog 1000 10
mpirun -n 2 ./prog 1000 10
mpirun -n 2 ./prog 1000 10
mpirun -n 2 ./prog 1000 10

mpirun -n 2 ./prog 5000 10
mpirun -n 2 ./prog 5000 10
mpirun -n 2 ./prog 5000 10
mpirun -n 2 ./prog 5000 10
mpirun -n 2 ./prog 5000 10

mpirun -n 2 ./prog 10000 10
mpirun -n 2 ./prog 10000 10
mpirun -n 2 ./prog 10000 10
mpirun -n 2 ./prog 10000 10
mpirun -n 2 ./prog 10000 10

mpirun -n 2 ./prog 15000 10
mpirun -n 2 ./prog 15000 10
mpirun -n 2 ./prog 15000 10
mpirun -n 2 ./prog 15000 10
mpirun -n 2 ./prog 15000 10

mpirun -n 2 ./prog 25000 10
mpirun -n 2 ./prog 25000 10
mpirun -n 2 ./prog 25000 10
mpirun -n 2 ./prog 25000 10
mpirun -n 2 ./prog 25000 10


#4 ranks
mpirun -n 4 ./prog 500 10
mpirun -n 4 ./prog 500 10
mpirun -n 4 ./prog 500 10
mpirun -n 4 ./prog 500 10
mpirun -n 4 ./prog 500 10

mpirun -n 4 ./prog 1000 10
mpirun -n 4 ./prog 1000 10
mpirun -n 4 ./prog 1000 10
mpirun -n 4 ./prog 1000 10
mpirun -n 4 ./prog 1000 10

mpirun -n 4 ./prog 5000 10
mpirun -n 4 ./prog 5000 10
mpirun -n 4 ./prog 5000 10
mpirun -n 4 ./prog 5000 10
mpirun -n 4 ./prog 5000 10

mpirun -n 4 ./prog 10000 10
mpirun -n 4 ./prog 10000 10
mpirun -n 4 ./prog 10000 10
mpirun -n 4 ./prog 10000 10
mpirun -n 4 ./prog 10000 10

mpirun -n 4 ./prog 15000 10
mpirun -n 4 ./prog 15000 10
mpirun -n 4 ./prog 15000 10
mpirun -n 4 ./prog 15000 10
mpirun -n 4 ./prog 15000 10

mpirun -n 4 ./prog 25000 10
mpirun -n 4 ./prog 25000 10
mpirun -n 4 ./prog 25000 10
mpirun -n 4 ./prog 25000 10
mpirun -n 4 ./prog 25000 10

#8 ranks
mpirun -n 8 ./prog 500 10
mpirun -n 8 ./prog 500 10
mpirun -n 8 ./prog 500 10
mpirun -n 8 ./prog 500 10
mpirun -n 8 ./prog 500 10

mpirun -n 8 ./prog 1000 10
mpirun -n 8 ./prog 1000 10
mpirun -n 8 ./prog 1000 10
mpirun -n 8 ./prog 1000 10
mpirun -n 8 ./prog 1000 10

mpirun -n 8 ./prog 5000 10
mpirun -n 8 ./prog 5000 10
mpirun -n 8 ./prog 5000 10
mpirun -n 8 ./prog 5000 10
mpirun -n 8 ./prog 5000 10

mpirun -n 8 ./prog 10000 10
mpirun -n 8 ./prog 10000 10
mpirun -n 8 ./prog 10000 10
mpirun -n 8 ./prog 10000 10
mpirun -n 8 ./prog 10000 10

mpirun -n 8 ./prog 15000 10
mpirun -n 8 ./prog 15000 10
mpirun -n 8 ./prog 15000 10
mpirun -n 8 ./prog 15000 10
mpirun -n 8 ./prog 15000 10

mpirun -n 8 ./prog 25000 10
mpirun -n 8 ./prog 25000 10
mpirun -n 8 ./prog 25000 10
mpirun -n 8 ./prog 25000 10
mpirun -n 8 ./prog 25000 10


#16 ranks
mpirun -n 16 ./prog 500 10
mpirun -n 16 ./prog 500 10
mpirun -n 16 ./prog 500 10
mpirun -n 16 ./prog 500 10
mpirun -n 16 ./prog 500 10

mpirun -n 16 ./prog 1000 10
mpirun -n 16 ./prog 1000 10
mpirun -n 16 ./prog 1000 10
mpirun -n 16 ./prog 1000 10
mpirun -n 16 ./prog 1000 10

mpirun -n 16 ./prog 5000 10
mpirun -n 16 ./prog 5000 10
mpirun -n 16 ./prog 5000 10
mpirun -n 16 ./prog 5000 10
mpirun -n 16 ./prog 5000 10

mpirun -n 16 ./prog 10000 10
mpirun -n 16 ./prog 10000 10
mpirun -n 16 ./prog 10000 10
mpirun -n 16 ./prog 10000 10
mpirun -n 16 ./prog 10000 10

mpirun -n 16 ./prog 15000 10
mpirun -n 16 ./prog 15000 10
mpirun -n 16 ./prog 15000 10
mpirun -n 16 ./prog 15000 10
mpirun -n 16 ./prog 15000 10

mpirun -n 16 ./prog 25000 10
mpirun -n 16 ./prog 25000 10
mpirun -n 16 ./prog 25000 10
mpirun -n 16 ./prog 25000 10
mpirun -n 16 ./prog 25000 10
