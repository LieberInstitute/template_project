## Load required packages first
## doing so helps error out fast in case you are missing some packages
library("here") ## for using relative paths across the whole project
library("sessioninfo") ## for reproducibility information
library("ggpubr") ## for plotting functions

## Define & create output directories
## We don't need an rdata directory in this case
# dir_rdata <- here("processed-data", "02_explore_data")
dir_plots <- here("plots", "02_explore_data")
# dir.create(dir_rdata, showWarnings = FALSE, recursive = TRUE)
dir.create(dir_plots, showWarnings = FALSE, recursive = TRUE)

## For creating the companion bash script using sgejobs
# sgejobs::job_single(
#     here("code", "02_explore_data", "02_boxplots"),
#     create_shell = TRUE,
#     queue = "bluejay"
# )

## Read in data, which is likely under processed-data and that we can locate
## using here::here()
penguins_data <-
    read.csv(here("processed-data", "01_read_data_to_r", "penguins_data.csv"))

## Define comparisons we want
my_comparisons <-
    list(
        c("Adelie", "Gentoo"),
        c("Gentoo", "Chinstrap"),
        c("Adelie", "Chinstrap")
    )

## Make a plot exploring the data
pdf(
    file = file.path(dir_plots, "penguins_boxplots.pdf"),
    width = 10,
    height = 7,
    useDingbats = FALSE
)
## width and height are in inches by default. Their default values are 7
## useDingats = FALSE makes it easier to deal with the resulting PDF on Adobe
## Illustrator later on
ggviolin(
    penguins_data,
    x = "species",
    y = "body_mass_g",
    fill = "island",
    palette = c("#00AFBB", "#E7B800", "#FC4E07"),
    add = "boxplot",
    add.params = list(fill = "white")
) +
    stat_compare_means(comparisons = my_comparisons, label = "p.signif") +
    stat_compare_means(label.y = 50) +
    theme_classic(base_size = 20)
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
