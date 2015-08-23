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

ev.types <- c("Astronomical Low Tide", "Avalanche", "Blizzard", "Coastal Flood", 
              "Cold/Wind Chill", "Debris Flow", "Dense Fog", "Dense Smoke", "Drought",
              "Dust Devil", "Dust Storm", "Excessive Heat", "Extreme Cold/Wind Chill",
              "Flash Flood", "Flood", "Frost/Freeze", "Funnel Cloud", "Freezing Fog",
              "Hail", "Heat", "Heavy Rain", "Heavy Snow", "High Surf", "High Wind",
              "Hurricane (Typhoon)", "Ice Storm", "Lake-Effect Snow", "Lakeshore Flood",
              "Lightning", "Marine Hail", "Marine High Wind", "Marine Strong Wind",
              "Marine Thunderstorm Wind", "Rip Current", "Seiche", "Sleet", "Storm Surge/Tide",
              "Strong Wind", "Thunderstorm Wind", "Tornado", "Tropical Depression",
              "Tropical Storm", "Tsunami", "Volcanic Ash", "Waterspout", "Wildfire",
              "Winter Storm", "Winter Weather")
ev.types.normal <- sapply(ev_types, Normalize)

