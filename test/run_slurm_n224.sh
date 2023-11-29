#!/bin/bash
#SBATCH -J heart_demo_n224
#SBATCH -A ACD110018
#SBATCH -p ct224
#SBATCH -o heart_demo_n224_out_%j.log
#SBATCH -e heart_demo_n224_err_%j.log
#SBATCH -N 4
#SBATCH -n 224
#SBATCH -c 1

. /opt/ohpc/Taiwania3/pkg/intel/2022.2/setvars.sh
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
echo n=$SLURM_NTASKS

cd ~/Cardiac_demo
make

cd build
time mpiexec ./heart_demo -m ../mesh_mid -s ../setup_mid.txt -t 50 2>&1 > /dev/null
