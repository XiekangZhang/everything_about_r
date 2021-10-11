# as caculator
1 + 1
1 + 2 + 3
8 + 9 - 6
4 / 3
4 * (6 + 5)

# variables
x <- 5
x
a <- b <- 7 # a = 7 and b = 7
assign("j", 4)
rm(j)

# data types
c <- 2
c
class(c)
is.numeric(c)
i <- 5L # integer
class(i)
d <- "data"
d
y <- factor("data")
nchar(d)
nchar(54)

date1 <- as.Date("2012-06-28")
date1
class(date1)
as.numeric(date1) # nth day of unix epoch
date2 <- as.POSIXct("2012-06-28 17:42")
date2
class(date2)
as.numeric(date2) # semi-seconds

TRUE * 5 # TRUE --> 1, FALSE --> 0
class(TRUE)

2 == 3
2 != 3
