theList <- list(
    A = matrix(1:9, nrow = 3),
    B = 1:5, C = matrix(1:4, 2), D = 2
)

# return a list
lapply(theList, sum)

# return vector
sapply(theList, sum)

theNames <- c("Jared", "Deb", "Paul")
lapply(theNames, nchar)
