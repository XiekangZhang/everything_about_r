x <- 1:10
mean(x)
sum(x)

mean(x = x, trim = .1)
mean(x = x, na.rm = TRUE)
x[c(2, 6)] <- NA
mean(x)
mean(x, na.rm = TRUE)
