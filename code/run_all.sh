#!/bin/bash
#$ -cwd
#$ -l mem_free=2G,h_vmem=2G,h_fsize=100G
#$ -N run_all_template_project
#$ -o logs/run_all_template_project.txt
#$ -e logs/run_all_template_project.txt
#$ -m e

## Adapted from https://github.com/LieberInstitute/Visium_IF_AD/blob/master/code/run_all_post_spaceranger.sh
## and https://github.com/LieberInstitute/ranger_metrics/blob/master/code/spaceranger/run_all.sh

echo "**** Job starts ****"
date

echo "**** JHPCE info ****"
echo "User: ${USER}"
echo "Job id: ${JOB_ID}"
echo "Job name: ${JOB_NAME}"
echo "Hostname: ${HOSTNAME}"
echo "Task id: ${SGE_TASK_ID}"

## List current modules for reproducibility
module list

MAINDIR="/dcs04/lieber/lcolladotor/_jhpce_org_LIBD001/template_project"
CODEDIR="${MAINDIR}/code"
PROCESSEDIR="${MAINDIR}/processed-data"

## Update code style
cd ${CODEDIR}
## Will crash if you don't have 'module load conda_R' in your ~/.bashrc file
## See https://lcolladotor.github.io/bioc_team_ds/config-files.html#bashrc
Rscript update_style.R

## Read in some raw-data into R
cd ${CODEDIR}/01_read_data_to_r
mkdir -p logs ## Create the logs directory if it doesn't exist
# Delete outputs before re-generating them: log file + data
rm logs/01_read_data_to_r.txt
rm ${PROCESSEDIR}/01_read_data_to_r/penguins_data.csv
qsub 01_read_data_to_r.sh

## Explore the data
cd ${CODEDIR}/02_explore_data
mkdir -p logs ## Create the logs directory if it doesn't exist
rm logs/01_ggpairs.txt
qsub 01_ggpairs.sh
rm logs/02_boxplots.txt
qsub 02_boxplots.sh


## Add future steps here

echo "**** Job ends ****"
date

## This script was made using sgejobs version 0.99.1
## available from http://research.libd.org/sgejobs/
