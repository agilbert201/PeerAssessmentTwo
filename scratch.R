require(data.table)

## Loading
kDataSetUrl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
kDataSetBz <- file.path("data", "StormData.csv.bz2")
#kDataSetCsv <- file.path("data", "StormData.csv")

if (!file.exists(kDataSetBz)) {
    download.file(kDataSetUrl, kDataSetBz, method = "curl")
}

## Reading Data Table
if (!exists("storm.data.raw")) {
    df <- read.csv(kDataSetBz, stringsAsFactors = FALSE)
    storm.data.raw <- data.table(df)
}

## Normalizing EVTYPE
ev.names <- storm.data.raw[,EVTYPE]
Normalize <- function(x) { toupper(trimws(x)) }
ev.names.normal <- sapply(ev.names, Normalize)

by.name <- factor(ev.names.normal)
aggregate(ev.names.normal, by = list(by.name), length)
evtypes.counts <- aggregate(ev.names.normal, by = list(by.name), length)

