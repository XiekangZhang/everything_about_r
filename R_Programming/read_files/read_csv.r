# R converts character automatically to factors --> high computational resource
# set stringsAsFactors to FALSE
tomato <- read.table(
    file = "R/R_Programming_Resources/Tomato First.csv",
    header = TRUE, sep = ",", stringsAsFactors = FALSE
)
tomato
class(tomato$Tomato)

library(dplyr)
