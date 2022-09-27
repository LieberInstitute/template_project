## Load required packages first
## doing so helps error out fast in case you are missing some packages
library("here") ## for using relative paths across the whole project
library("sessioninfo") ## for reproducibility information
library("palmerpenguins") ## for example data

## Define & create output directories
dir_rdata <- here("processed-data", "01_read_data_to_r")
## We don't need a plots directory in this case
# dir_plots <- here("plots", "01_read_data_to_r")
dir.create(dir_rdata, showWarnings = FALSE, recursive = TRUE)
# dir.create(dir_plots, showWarnings = FALSE, recursive = TRUE)

## For creating the companion bash script using sgejobs
# sgejobs::job_single(
#     here("code", "01_read_data_to_r", "01_read_data_to_r"),
#     create_shell = TRUE,
#     queue = "bluejay"
# )

## Read in raw-data
## for this example, we'll just load some data in an R package
data(package = "palmerpenguins")

## Explore the raw data
dim(penguins)
head(penguins)

## Export for later use
write.csv(penguins, file = file.path(dir_rdata, "penguins_data.csv"), row.names = FALSE)

## Reproducibility information
print("Reproducibility information:")
Sys.time()
proc.time()
options(width = 120) ## Makes it easier to read later
session_info() ## We want to record this information on the log file. If you
## don't have a companion shell script (sgejobs), then copy-paste the output
## into this script.
