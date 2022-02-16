require(ggplot2)
data(diamonds)
head(diamonds)
mean(diamonds$price)
diamonds["price"]

# aggregate(formula, datasets, func)
aggregate(price ~ cut, diamonds, mean)
aggregate(price ~ cut, diamonds, mean, na.rm = TRUE)

aggregate(price ~ cut + color, diamonds, mean)
aggregate(cbind(price, carat) ~ cut + color, diamonds, mean)
aggregate(cbind(price, carat) ~ cut, diamonds, mean)
