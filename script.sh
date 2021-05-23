#!/usr/bin/env bash

#SBATCH -p csedu

mpicc -DMPI -O3 -march=native -o prog relax-mpi.c
mpirun --mca btl_base_warn_component_unused 0 -n 1 ./prog 5000 10
mpirun --mca btl_base_warn_component_unused 0 -n 1 ./prog 5000 10
mpirun --mca btl_base_warn_component_unused 0 -n 1 ./prog 5000 10
mpirun --mca btl_base_warn_component_unused 0 -n 1 ./prog 5000 10
mpirun --mca btl_base_warn_component_unused 0 -n 1 ./prog 5000 10

mpirun --mca btl_base_warn_component_unused 0 -n 2 ./prog 5000 10
mpirun --mca btl_base_warn_component_unused 0 -n 2 ./prog 5000 10
mpirun --mca btl_base_warn_component_unused 0 -n 2 ./prog 5000 10
mpirun --mca btl_base_warn_component_unused 0 -n 2 ./prog 5000 10
mpirun --mca btl_base_warn_component_unused 0 -n 2 ./prog 5000 10

mpirun --mca btl_base_warn_component_unused 0 -n 4 ./prog 5000 10 
mpirun --mca btl_base_warn_component_unused 0 -n 4 ./prog 5000 10 
mpirun --mca btl_base_warn_component_unused 0 -n 4 ./prog 5000 10  
mpirun --mca btl_base_warn_component_unused 0 -n 4 ./prog 5000 10
mpirun --mca btl_base_warn_component_unused 0 -n 4 ./prog 5000 10

mpirun --mca btl_base_warn_component_unused 0 -n 8 ./prog 5000 10
mpirun --mca btl_base_warn_component_unused 0 -n 8 ./prog 5000 10
mpirun --mca btl_base_warn_component_unused 0 -n 8 ./prog 5000 10
mpirun --mca btl_base_warn_component_unused 0 -n 8 ./prog 5000 10
mpirun --mca btl_base_warn_component_unused 0 -n 8 ./prog 5000 10
