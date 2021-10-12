a <- matrix(1:10, nrow = 5)
a
b <- matrix(21:30, nrow = 5)
b
a + b
a * b
a == b

# matrix multiplication
a %*% t(b)
