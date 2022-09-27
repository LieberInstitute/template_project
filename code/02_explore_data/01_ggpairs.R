## Load required packages first
## doing so helps error out fast in case you are missing some packages
library("here") ## for using relative paths across the whole project
library("sessioninfo") ## for reproducibility information
library("GGally") ## for plotting functions

## Define & create output directories
## We don't need an rdata directory in this case
# dir_rdata <- here("processed-data", "02_explore_data")
dir_plots <- here("plots", "02_explore_data")
# dir.create(dir_rdata, showWarnings = FALSE, recursive = TRUE)
dir.create(dir_plots, showWarnings = FALSE, recursive = TRUE)

## For creating the companion bash script using sgejobs
# sgejobs::job_single(
#     here("code", "02_explore_data", "01_ggpairs"),
#     create_shell = TRUE,
#     queue = "bluejay"
# )

## Read in data, which is likely under processed-data and that we can locate
## using here::here()
penguins_data <-
    read.csv(here("processed-data", "01_read_data_to_r", "penguins_data.csv"))

## Make a plot exploring the data
pdf(
    file = file.path(dir_plots, "penguins_ggpairs.pdf"),
    width = 18,
    height = 18,
    useDingbats = FALSE
)
## width and height are in inches by default. Their default values are 7
## useDingats = FALSE makes it easier to deal with the resulting PDF on Adobe
## Illustrator later on
ggpairs(penguins_data) +
    theme_bw(base_size = 20)
## Use a base_size larger than the default to make it easier to read the text
dev.off()

## Reproducibility information
print("Reproducibility information:")
Sys.time()
proc.time()
options(width = 120) ## Makes it easier to read later
session_info() ## We want to record this information on the log file. If you
## don't have a companion shell script (sgejobs), then copy-paste the output
## into this script.
