#!/bin/bash
#SBATCH --job-name=psarrasbenchmark
#SBATCH --output=psarrasbenchmark.txt
#SBATCH --nodes=1
#SBATCH --ntasks=40
#SBATCH --time=12:00:00
#SBATCH --account=def-shirimb

# Load necessary modules
module load gcc/8.3.0
module load r/4.2.2-batteries-included

export MKLROOT=/gpfs/fs1/scinet/intel/2019u4/compilers_and_libraries_2019.4.243/linux/mkl
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MKLROOT/lib/intel64_lin
export R_LIBS_USER=/scratch/s/shirimb/msep/cpp11eigen/Rlib
export OMP_NUM_THREADS=40
export MKL_NUM_THREADS=40

# Run the R script
Rscript dev/05-psarras-bench.r