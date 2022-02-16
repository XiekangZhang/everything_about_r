# Oreilly R

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
matrix: restricted to two dimensions with same type
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

ggplot2 library:

- ggplot(data, aes?) + geom_histogram(aes?)/geom_density(aes?)/geom_point(aes?)/geom_line(aes?)

## Group Manipulation

- apply(matrix, margin, function, na.rm=Boolean)
- lapply(list/vector, ...) -> return list
- sapply(list/vector, ...) -> return vector
- mapply(func, list/vector, list/vector) -> return vector
- tapply(array, INDEX, func) -> return vector

## aggregate --> quite slow

- formula: calculation ~ group
- aggregate(formula, data, func, na.rm=Boolean)

## plyr --> split-apply-combine, could be slow

- ddply(dataframe, .variables = col used to split data, .fun = func) -> return dataframe
- llply(list, func) --> return list
- laply(list, func) --> return array/vector without name

## data.table

- data.frame return character as factor, but data.table not
- df[col] or df$col to access data, dt[, list(col), with=TRUE --> take cols as char]
- dt[selection keys by c()/J(multiple-keys), func(args)/list(col_name=func(col),...), by=list(cols)/with] --> setkey(dt, key_col)

## dplyr

- %>% pipe operation
- tbl %>% select(col1|col1_index, col2|col2_index) = select(tbl, col1, col2)
- tbl %>% select(one_of("col1", "col2"))
- select(starts_with(char)|ends_with(char)|contains(char)|matches(reg)|-col)
- filter(col == ""|col %in% c("", "") --> or|)
- slice()
- mutate(new_col = value, col = new value)
- summarise(func(args))
- group_by(col1, col2)
- arrange(col|desc(col))
- do(func(., args)) --> . means the same input tbl

# An Introduction to R

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
