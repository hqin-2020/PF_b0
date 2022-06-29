#!/bin/bash

#SBATCH --job-name=pf808
#SBATCH --output=pf808.out
#SBATCH --error=pf808.err
#SBATCH --time=24:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=4
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=72000

# Load Python modules
module load python/anaconda-2020.02

python Run_Aso1_808.py 