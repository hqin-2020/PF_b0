#!/bin/bash

#SBATCH --job-name=pf208
#SBATCH --output=pf208.out
#SBATCH --error=pf208.err
#SBATCH --time=4:00:00
#SBATCH --partition=Broadway
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=7000

# Load Python modules
module load python/anaconda-2020.02

python Run_Aso1_20_8.py 