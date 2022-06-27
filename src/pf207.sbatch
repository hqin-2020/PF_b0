#!/bin/bash

#SBATCH --job-name=pf207
#SBATCH --output=pf207.out
#SBATCH --error=pf207.err
#SBATCH --time=4:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=3500

# Load Python modules
module load python/anaconda-2020.02

python Run_Aso1_20_7.py 