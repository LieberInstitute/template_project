#!/bin/bash
#SBATCH -p katun
#SBATCH --mem=10G
#SBATCH --job-name=01_read_data_to_r
#SBATCH -c 1
#SBATCH -t 1-00:00:00
#SBATCH -o logs/01_read_data_to_r.txt
#SBATCH -e logs/01_read_data_to_r.txt
#SBATCH --mail-type=ALL

set -e

echo "**** Job starts ****"
date

echo "**** JHPCE info ****"
echo "User: ${USER}"
echo "Job id: ${SLURM_JOB_ID}"
echo "Job name: ${SLURM_JOB_NAME}"
echo "Node name: ${HOSTNAME}"
echo "Task id: ${SLURM_ARRAY_TASK_ID}"

## Load the R module
module load conda_R/4.5

## List current modules for reproducibility
module list

## Edit with your job command
Rscript 01_read_data_to_r.R

echo "**** Job ends ****"
date

## This script was made using slurmjobs version 1.3.0
## available from http://research.libd.org/slurmjobs/
