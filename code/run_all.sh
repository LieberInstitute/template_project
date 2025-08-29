#!/bin/bash
#SBATCH -p katun
#SBATCH --mem=10G
#SBATCH --job-name=run_all_template_project
#SBATCH -c 1
#SBATCH -t 1-00:00:00
#SBATCH -o logs/run_all_template_project.txt
#SBATCH -e logs/run_all_template_project.txt
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

module load conda_R/4.5

## List current modules for reproducibility
module list

MAINDIR=$(git rev-parse --show-toplevel)
CODEDIR="${MAINDIR}/code"
PROCESSEDIR="${MAINDIR}/processed-data"

## Update code style
cd ${CODEDIR}
Rscript update_style.R

## Read in some raw-data into R
cd ${CODEDIR}/01_read_data_to_r
mkdir -p logs ## Create the logs directory if it doesn't exist
# Delete output data before re-generating them:
rm -f ${PROCESSEDIR}/01_read_data_to_r/penguins_data.csv
id1=$(sbatch --parsable 01_read_data_to_r.sh)

## Explore the data
cd ${CODEDIR}/02_explore_data
mkdir -p logs ## Create the logs directory if it doesn't exist
id2=$(sbatch --parsable --dependency=afterok:$id1 01_ggpairs.sh)
sbatch --dependency=afterok:$id2 02_boxplots.sh


## Add future steps here

echo "**** Job ends ****"
date

## This script was made using slurmjobs version 1.3.0
## available from http://research.libd.org/slurmjobs/
