#!/bin/bash

#SBATCH --job-name=pf807
#SBATCH --output=pf807.out
#SBATCH --error=pf807.err
#SBATCH --time=24:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=4
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=7200

# Load Python modules
module load python/anaconda-2020.02

python Run_Aso1_807.py 