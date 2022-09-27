# template_project


This is a template project following the guidelines from [organizing-your-work](https://lcolladotor.github.io/bioc_team_ds/organizing-your-work.html#.YzL43uzMKX0).

For realistic examples, check:

* [LieberInstitute/Visium_IF_AD](https://github.com/LieberInstitute/Visium_IF_AD)
* [LieberInstitute/DLPFC_snRNAseq](https://github.com/LieberInstitute/DLPFC_snRNAseq)
* [LieberInstitute/spatialDLPFC](https://github.com/LieberInstitute/spatialDLPFC)


## Internal

* JHPCE location: `/dcs04/lieber/yourTeam/someProject_LIBDcode/yourRepository` such as `/dcs04/lieber/lcolladotor/spatialDLPFC_LIBD4035/spatialDLPFC`


## Contents

* `template_project.Rproj`: an RStudio project file with some non-default settings that we use frequently. They protect us from making some hard to reproduce errors (involve .RData files) as well as ensure that we can work from winOS and macOS without issues. These are:
  * Restore .RData into workspace at startup: No
  * Save workspace to .RData on exit: No
  * Always save history (even if not saving .RData): No
  * Tab width: 4
  * Line ending conversion: Posix (LF)
  
## How to adapt this template

* Create a new repository (`yourRepository`) following the instructions from GitHub on [creating a repository from a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).
* Rename `template_project.Rproj` to match the name of the new repository you created (`yourRepository`)
* Update the JHPCE location of the clone you made of `yourRepository`
  * The `yourTeam` portion will likely be `lcolladotor` or `marmaypag` or some other LIBD team.
  * Ask which LIBD code this project belongs to in order to figure out the `someProject_LIBDcode`
* Update the JHPCE permissions of your user group. For example, by following the instructions on the [`#libd_jhu_spatial`](https://jhu-genomics.slack.com/archives/CR9NYA0BF/p1639091722135100) Slack channel.
  * Summary: `sh /dcs04/lieber/lcolladotor/_jhpce_org_LIBD001/update_permissions_spatialteam.sh /dcs04/lieber/yourTeam/someProject_LIBDcode/yourRepository`

