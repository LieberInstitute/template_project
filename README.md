# template_project


This is a template project following the guidelines from [organizing-your-work](https://lcolladotor.github.io/bioc_team_ds/organizing-your-work.html#.YzL43uzMKX0).

## Internal

* JHPCE location: `/dcs04/lieber/yourTeam/someProject_LIBDcode/yourRepository` such as `/dcs04/lieber/lcolladotor/spatialDLPFC_LIBD4035/spatialDLPFC`. This template is located at `/dcs04/lieber/lcolladotor/_jhpce_org_LIBD001/template_project`.


## Examples

For realistic examples, check:

* [LieberInstitute/ranger_metrics](https://github.com/LieberInstitute/ranger_metrics)
* [LieberInstitute/Visium_IF_AD](https://github.com/LieberInstitute/Visium_IF_AD)
* [LieberInstitute/DLPFC_snRNAseq](https://github.com/LieberInstitute/DLPFC_snRNAseq)
* [LieberInstitute/spatialDLPFC](https://github.com/LieberInstitute/spatialDLPFC)

## Contents

* [`template_project.Rproj`](https://github.com/LieberInstitute/template_project/blob/main/template_project.Rproj): an RStudio project file with some non-default settings that we use frequently. They protect us from making some hard to reproduce errors (involving `.RData` files) as well as ensure that we can work from winOS (Microsoft Windows) and macOS (Apple) without issues. These are:
  * Restore .RData into workspace at startup: `No`
  * Save workspace to .RData on exit: `No`
  * Always save history (even if not saving .RData): `No`
    * These 3 options help prevent some irreproducible results/errors.
  * Tab width: `4`
    * Default tab width used in Bioconductor projects.
  * Line ending conversion: `Posix (LF)`.
    * Selecting this option makes it easy to work with the same repo on both winOS and linux/macOS.
* [`raw-data`](https://github.com/LieberInstitute/template_project/blob/main/raw-data): example organization for the `raw-data` files.
  * This is data that is not produced by any code in this repository and that we should back up. Using the same `raw-data` location in every project makes it easy for us to identify directories we need to back up across all projects.
  * Contains example `.gitignore` and `README.md` files.
* [`code`](https://github.com/LieberInstitute/template_project/blob/main/code): example organization for the `code` files.
  * Contains example files for 2 analysis steps and 3 example R scripts.
  * [`code/run_all.sh`](https://github.com/LieberInstitute/template_project/blob/main/code/run_all.sh): example bash script for re-running all analyses in this project.
  * [`code/update_style.R`](https://github.com/LieberInstitute/template_project/blob/main/code/update_style.R): common R script we use for automatically styling all code we write, which makes it easier to read across projects. It uses [`styler`](https://styler.r-lib.org/) and [`biocthis`](https://lcolladotor.github.io/biocthis/) to accomplish this.
* [`processed-data`](https://github.com/LieberInstitute/template_project/blob/main/processed-data): example organization for the `processed-data` files.
  * Any data that can be recreated with the contents from `code` (which are version controlled) and `raw-data` (which ideally should be backed up). It might take some time to recreate this data, but in theory we should have the resources to do this.
  * We version control small output summary files (typically < 25 Mb), such as files that end up being supplementary files of a paper.
* [`plots`](https://github.com/LieberInstitute/template_project/blob/main/plots): example organization for the `plots` files.
  * We typically only version control small plot files (about < 25 Mb). We can then share the specific plot links on Slack or elsewhere, such that if we later update the plot(s), the links will still work. We can also see how they changed over time thanks to having version controlled them.
  
## How to use this template

* Create a new repository (`yourRepository`) following the instructions from GitHub on [creating a repository from a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).
* Rename [`template_project.Rproj`](https://github.com/LieberInstitute/template_project/blob/main/template_project.Rproj) to match the name of the new repository you created (`yourRepository.Rproj` for `yourRepository`)
* Update the JHPCE location of the clone you made of `yourRepository`
  * The `yourTeam` portion will likely be `lcolladotor` or `marmaypag` or some other LIBD team.
  * Ask which LIBD code this project belongs to in order to figure out the `someProject_LIBDcode`
* Update the JHPCE permissions of your user group. For example, by following the instructions on the [`#libd_jhu_spatial`](https://jhu-genomics.slack.com/archives/CR9NYA0BF/p1639091722135100) Slack private channel or [`organizing-your-work.html#dcs04-scripts`](https://lcolladotor.github.io/bioc_team_ds/organizing-your-work.html#dcs04-scripts) (public).
  * Summary: `sh /dcs04/lieber/lcolladotor/_jhpce_org_LIBD001/update_permissions_spatialteam.sh /dcs04/lieber/yourTeam/someProject_LIBDcode/yourRepository`
* Add any `raw-data` related to your project.
  * See [`raw-data/FASTQ/README.md`](https://github.com/LieberInstitute/template_project/blob/main/raw-data/FASTQ/README.md) for information about creating [soft links](https://www.cyberciti.biz/faq/creating-soft-link-or-symbolic-link/) (symbolic links) for external raw-data files.
  * See [`raw-data/FASTQ/.gitignore`](https://github.com/LieberInstitute/template_project/blob/main/raw-data/FASTQ/.gitignore) for information about making very specific `.gitignore` files.
  * See [`raw-data/sample_info/README.md`](https://github.com/LieberInstitute/template_project/blob/main/raw-data/sample_info/README.md) about where to document sample sheets (typically Excel files) we use for sequencing orders with the JHU Single Cell & Transcriptomics Core.
* Start your first code directory, like `code/01_something`. Typically this first step reads in data from `raw-data` and imports it into R.
  * See [`code/01_read_data_to_r/01_read_data_to_r.R`](https://github.com/LieberInstitute/template_project/blob/main/code/01_read_data_to_r/01_read_data_to_r.R) as an example R script.
* Use [`sgejobs::job_single()`](http://research.libd.org/sgejobs/reference/job_single.html) to create a companion shell script for your R script, such that you can use `qsub` to run it at [JHCPE](http://www.jhpce.jhu.edu/).
  * See [`code/01_read_data_to_r/01_read_data_to_r.sh`](https://github.com/LieberInstitute/template_project/blob/main/code/01_read_data_to_r/01_read_data_to_r.sh) as an example bash script created with `sgejobs::job_single()`.
* Edit the [`code/run_all.sh`](https://github.com/LieberInstitute/template_project/blob/main/code/run_all.sh) script that specifies how you can re-run all analyses.
  * This file is useful for reproducibility and for cases when we do need to re-run all or part of the analyses. For example, after a bug fix in a package the analysis depends on.
  * This file also acts as a detailed `README.md`.
* Once you have read your data into R, you will start having scripts that depend on the output of previous ones. See [`code/02_boxplots`](https://github.com/LieberInstitute/template_project/blob/main/code/02_boxplots) for an example of this case.
  * [`code/02_boxplots/01_ggpairs.R`](https://github.com/LieberInstitute/template_project/blob/main/code/02_boxplots/01_ggpairs.R) uses the data created in the previous step. Now how `01_ggpairs.R` starts again at `01` since this is the first script on this second analysis code step (`02_boxplots`).
  * [`code/02_boxplots/01_ggpairs.sh`](https://github.com/LieberInstitute/template_project/blob/main/code/02_boxplots/01_ggpairs.sh) uses the `hold_jid` option for `qsub` that allows you to specify that this script has to wait for a previous one to finish running. This allows us to use [`code/run_all.sh`](https://github.com/LieberInstitute/template_project/blob/main/code/run_all.sh) effectively.
  
Good luck!! If you have any questions about how to organize files, feel free to schedule a [Data Science guidance session (DSgs)](https://lcolladotor.github.io/bioc_team_ds/data-science-guidance-sessions.html#.YzMSS-zMKX0) with any team member.
