#!/bin/bash

#SBATCH --job-name=pf308
#SBATCH --output=pf308.out
#SBATCH --error=pf308.err
#SBATCH --time=5:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=7000
#SBATCH --constraint=fdr

# Load Python modules
module load python/anaconda-2020.02

python Run_Aso1_30_8.py 