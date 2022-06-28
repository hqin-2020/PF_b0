#!/bin/bash

#SBATCH --account=pi-lhansen
#SBATCH --job-name=pf807p
#SBATCH --output=pf807p.out
#SBATCH --error=pf807p.err
#SBATCH --time=0-23:00:00
#SBATCH --partition=standard
#SBATCH --cpus-per-task=1
#SBATCH --mem=32G

# Load Python modules
module load python/booth/3.8/3.8.5

srun python3 Run_Aso1_807.py  