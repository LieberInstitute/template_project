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

## Re-combine the pre-sequencing summaries
cd ${CODEDIR}/01_read_experimental_summaries
rm logs/01_read_summaries.txt
rm ${PROCESSEDIR}/01_read_experimental_summaries/presequencing_summary.csv
qsub 01_read_summaries.sh

## Re-combine the spaceranger metrics
cd ${CODEDIR}/02_read_spaceranger_summaries
rm logs/01_read_spaceranger_metrics.txt
rm ${PROCESSEDIR}/02_read_spaceranger_summaries/sequencing_metrics.csv
qsub 01_read_spaceranger_metrics.sh

## Combine both tables and explore them
cd ${CODEDIR}/03_merged_metrics
rm logs/01_merge_metrics.txt
rm ${PROCESSEDIR}/03_merged_metrics/merged_metrics.csv
qsub 01_merge_metrics.sh
rm logs/02_explore_metrics.txt
qsub 02_explore_metrics.sh


## Add future steps here

echo "**** Job ends ****"
date

## This script was made using sgejobs version 0.99.1
## available from http://research.libd.org/sgejobs/
