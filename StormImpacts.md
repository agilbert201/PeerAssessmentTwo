---
title: "Storm Impact Analysis"
author: "Andrew Gilbert"
date: "August 21, 2015"
output: html_document
---

## Setup

* National Weather Service [Storm Data Documentation](https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf)

* National Climatic Data Center Storm Events [FAQ](https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf)

Load depedent packages and ensure we have access to dataset.


```r
require(data.table)

## Loading
kDataSetUrl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
kDataSetBz <- file.path("data", "StormData.csv.bz2")
#kDataSetCsv <- file.path("data", "StormData.csv")

if (!file.exists(kDataSetBz)) {
    download.file(kDataSetUrl, kDataSetBz, method = "curl")
}

if (!exists("storm.data.raw")) {
    df <- read.csv(kDataSetBz, stringsAsFactors = FALSE)
    storm.data.raw <- data.table(df)
}
```


You can also embed plots, for example:



Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
