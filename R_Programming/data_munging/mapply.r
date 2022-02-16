firstList <- list(A = matrix(1:16, 4), B = matrix(1:16, 2), C = 1:5)
secondList <- list(A = matrix(1:16, 4), B = matrix(1:16, 8), C = 15:1)
firstList
secondList

mapply(identical, firstList, secondList)

simplefunc <- function(x, y) {
    NROW(x) + NROW(y)
}

mapply(simplefunc, firstList, secondList)
