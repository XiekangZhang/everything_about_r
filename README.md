# everything_about_r

install.packages("package name")
remove.packages("package name")
library("loading package")
detach("loaded package")
getwd(): to get working directory

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

## Making Statistical Graphs

## An Introduction to R

### Introduction and preliminaries

- R is an integrated suite of software facilities for data manipulation, calculation and graphical display
- R: interactive data analysis
- R can be regarded as an implementation of the S language
- R is case sensitive
- Command lines entered at the console are limited to about 4095 bytes
- use rm(parameter_names) to remove objects

### Simple manupulations: numbers and vectors

- +, -, \*, / and ^, log, exp, sin, cos, tan, sqrt, max, min, range(c(from, to)), length, sum, prod, mean, var, sort, order, sort.list(), pmin, pmax
- c(1, 2, ..., 29, 30), seq(from, to, by/length, along=vector\*), seq(vector, times/each)
