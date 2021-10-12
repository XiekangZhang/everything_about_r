# everything_about_r

install.packages("package name")
remove.packages("package name")
library("loading package")
detach("loaded package")

x <- value / x = value

## Data Structure

vector: everything in R is vector. A vector is a collection of elements, all of the same type
dataframe: A dataframe can contain many different data type in each column. --> could be understood as excel spreedsheet
lists --> hold arbitrary objects of either the same type or varying types
matrix: restricted to two dimensions
arrays: a multidimensional vector --> all the same type

## Reading Data into R

csv: read.table() vs read.csv2: better resource vs better for ill formated file
excel: excel files are binary files: readxl vs openxlsx (no supports for missing data)
databases: Using RODBC
other tools: by using foreign package
load binary R files: save(variable name..., file = "path.rdata") --> load("path.rdata")
ggplot2 provides some data --> library(ggplot2), data(diamonds) --> to see all the provided data by using data()
scrape data from the web: library(XML), library(rvest)
json: library(rjson) / library(jsonlite)
