#!/bin/bash

#SBATCH --job-name=pf307
#SBATCH --output=pf307.out
#SBATCH --error=pf307.err
#SBATCH --time=5:00:00
#SBATCH --partition=broadwl
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=3500
#SBATCH --constraint=fdr

# Load Python modules
module load python/anaconda-2020.02

python Run_Aso1_30_7.py 