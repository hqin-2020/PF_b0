#!/bin/bash

#SBATCH --job-name=pf30
#SBATCH --output=pf30.out
#SBATCH --error=pf30.err
#SBATCH --time=5:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=1
#SBATCH --cpus-per-task=28
#SBATCH --mem=64G
#SBATCH --constraint=fdr

# Load Python modules
module load python/anaconda-2020.02

python Run_Aso1_30.py 