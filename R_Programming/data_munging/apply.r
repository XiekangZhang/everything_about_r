theMatrix <- matrix(1:9, nrow = 3)
theMatrix

# apply works on matrix
apply(theMatrix, MARGIN = 2, FUN = sum)
apply(theMatrix, MARGIN = 1, sum)

colSums(theMatrix)
rowSums(theMatrix)

theMatrix[2, 1] <- NA
theMatrix
rowSums(theMatrix)

apply(theMatrix, MARGIN = 1, FUN = sum, na.rm = TRUE)
rowSums(theMatrix, na.rm = TRUE)

