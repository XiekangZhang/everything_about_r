# https://www.jaredlander.com/data/
codes <- read.table("data/countryCodes.csv",
    header = TRUE, sep = ",",
    stringsAsFactors = FALSE
)
countries <- read.table("data/GovType.csv",
    header = TRUE, sep = ",",
    stringsAsFactors = FALSE
)
head(codes)
head(countries)
View(countries)

countryMerged <- merge(
    x = codes, y = countries, by.x = "Country.name",
    by.y = "Country"
)

View(countryMerged)

# for large data
require(plyr)
codes <- rename(codes, c(Country.name = "Country"))
countryJoined <- join(x = codes, y = countries, by = "Country")
View(countryJoined)
