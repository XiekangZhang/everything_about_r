library(shiny)
library(ggplot2)
library(leaflet)
library(shinydashboard)

data(diamonds, package = "ggplot2")

pizza <- jsonlite::fromJSON(
  "/mnt/Documents/Workspace/R/R_Programming/Shiny/markdown/FavoriteSpots.json"
) %>% tidyr::unnest(cols = c(Details, Coordinates))