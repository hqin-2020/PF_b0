#!/bin/bash

#SBATCH --job-name=pf508
#SBATCH --output=pf508.out
#SBATCH --error=pf508.err
#SBATCH --time=8:00:00
#SBATCH --partition=bigmem2
#SBATCH --nodes=1
#SBATCH --cpus-per-task=28
#SBATCH --mem=128G
#SBATCH --constraint=fdr

# Load Python modules
module load python/anaconda-2020.02

python Run_Aso1_50_8.py 