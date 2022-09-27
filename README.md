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


