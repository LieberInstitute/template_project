# template_project


This is a template project following the guidelines from [organizing-your-work](https://lcolladotor.github.io/bioc_team_ds/organizing-your-work.html#.YzL43uzMKX0).

For realistic examples, check:

* [LieberInstitute/ranger_metrics](https://github.com/LieberInstitute/ranger_metrics)
* [LieberInstitute/Visium_IF_AD](https://github.com/LieberInstitute/Visium_IF_AD)
* [LieberInstitute/DLPFC_snRNAseq](https://github.com/LieberInstitute/DLPFC_snRNAseq)
* [LieberInstitute/spatialDLPFC](https://github.com/LieberInstitute/spatialDLPFC)


## Internal

* JHPCE location: `/dcs04/lieber/yourTeam/someProject_LIBDcode/yourRepository` such as `/dcs04/lieber/lcolladotor/spatialDLPFC_LIBD4035/spatialDLPFC`. This template is located at `/dcs04/lieber/lcolladotor/_jhpce_org_LIBD001/template_project`.


## Contents

* `template_project.Rproj`: an RStudio project file with some non-default settings that we use frequently. They protect us from making some hard to reproduce errors (involve .RData files) as well as ensure that we can work from winOS and macOS without issues. These are:
  * Restore .RData into workspace at startup: `No`
  * Save workspace to .RData on exit: `No`
  * Always save history (even if not saving .RData): `No`
    * These 3 options help prevent some irreproducible results/errors.
  * Tab width: `4`
    * Default tab width used in Bioconductor projects
  * Line ending conversion: `Posix (LF)`.
    * Selecting this option makes it easy to work with the same repo on both winOS and linux/macOS.
  
## How to adapt this template

* Create a new repository (`yourRepository`) following the instructions from GitHub on [creating a repository from a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).
* Rename [`template_project.Rproj`](https://github.com/LieberInstitute/template_project/blob/main/template_project.Rproj) to match the name of the new repository you created (`yourRepository.Rproj` for `yourRepository`)
* Update the JHPCE location of the clone you made of `yourRepository`
  * The `yourTeam` portion will likely be `lcolladotor` or `marmaypag` or some other LIBD team.
  * Ask which LIBD code this project belongs to in order to figure out the `someProject_LIBDcode`
* Update the JHPCE permissions of your user group. For example, by following the instructions on the [`#libd_jhu_spatial`](https://jhu-genomics.slack.com/archives/CR9NYA0BF/p1639091722135100) Slack channel.
  * Summary: `sh /dcs04/lieber/lcolladotor/_jhpce_org_LIBD001/update_permissions_spatialteam.sh /dcs04/lieber/yourTeam/someProject_LIBDcode/yourRepository`
* Add any `raw-data` related to your project.
  * See [`raw-data/FASTQ/README.md`](https://github.com/LieberInstitute/template_project/blob/main/raw-data/FASTQ/README.md) for information about creating soft links (symbolic links) for external raw-data files.
  * See [`raw-data/FASTQ/.gitignore`](https://github.com/LieberInstitute/template_project/blob/main/raw-data/FASTQ/.gitignore) for information about making very specific `.gitignore` files.
  * See [`raw-data/sample_info/README.md`](https://github.com/LieberInstitute/template_project/blob/main/raw-data/sample_info/README.md) about where to document sample sheets (typically Excel files) we use for sequencing orders with the JHU Single Cell & Transcriptomics Core.
