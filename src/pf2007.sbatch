#!/bin/bash

#SBATCH --job-name=pf2007
#SBATCH --output=pf2007.out
#SBATCH --error=pf2007.err
#SBATCH --time=24:00:00
#SBATCH --partition=bigmem2
#SBATCH --nodes=1
#SBATCH --cpus-per-task=28
#SBATCH --mem=256G

# Load Python modules
module load python/anaconda-2020.02

python Run_Aso1_200_7.py 