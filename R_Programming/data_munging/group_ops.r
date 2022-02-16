data(diamonds, package = "ggplot2")
head(diamonds)

aggregate(price ~ cut, diamonds, mean)
typeof(aggregate(price ~ cut, diamonds, mean))

# 1. for large ds --> faster than aggreate
tapply(diamonds$price, INDEX = diamonds$cut, mean)
# 2. ddply, daply ...

install.packages("doParallel")
require(doParallel)

# 3. parallel lines
c1 <- makeCluster(2)
registerDoParallel(c1)
ddply(diamonds, "cut", function(x) mean(x$price), .parallel = TRUE)

# 4. data table
require(data.table)
data(diamonds, package = "ggplot2")
diaDT <- data.table(diamonds)
diaDT

diaDT[, mean(price), by = cut]
tables()
# 5. dplyr
require(plyr)
require(dplyr)
head(diamonds)
dim(diamonds)
diamonds %>% head
diamonds %>% dim

# nested function run faster
diamonds %>% group_by(cut) %>% dplyr::summarise(Price = mean(price))

# 6. data larger than memory --> not working
library(DBI)
install.packages("RSQLite")
library(RSQLite)
download.file("https://www.jaredlander.com/data/diamonds.db",
    destfile = "diamonds.db",
    method = "curl"
)
diaDBSource <- DBI::dbConnect(RSQLite::SQLite(), "data/diamonds.db")
diaDBSource
diaDBSource <- src_sqlite("diamonds.db")
diaDB <- tbl(diaDBSource, "diamonds")
