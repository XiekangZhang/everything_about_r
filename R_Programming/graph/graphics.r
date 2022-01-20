library(ggplot2)
data(diamonds)
head(diamonds)

# hist
hist(diamonds$carat)
hist(diamonds$carat, main = "Carat Histogram", xlab = "test")

# plot
plot(diamonds$carat, diamonds$price)
plot(price ~ carat, diamonds)
plot(price ~ carat, data = diamonds, main = "new title")

# boxplots
# Q1-1.5*IQR, Q1, Q2(50%), Q3, Q3 + 1.5*IQR, IQR = Q3 - Q1
boxplot(diamonds$carat)

# ggplot2 --> build graphics layer by layer by using + sign
# Information + Layer
# geom_point, geom_histogram, geom_line
# aes(x, y) --> mapping
# binwidth = (max - min) / 30
ggplot(data = diamonds) + geom_histogram(aes(x = carat))
ggplot(data = diamonds) + geom_histogram(aes(x = carat), binwidth = .5)
ggplot(data = diamonds) + geom_histogram(aes(x = carat), binwidth = .1)

ggplot(data = diamonds) + geom_density(aes(x = carat))
ggplot(data = diamonds) + geom_density(aes(x = carat), fill = "grey50")

ggplot(data = diamonds, aes(x = carat, y = price)) + geom_point()
g <- ggplot(diamonds, mapping = aes(x = carat, y = price))
g + geom_point()
g + geom_point(mapping = aes(color = color))
g + geom_point(mapping = aes(color = color, shape = cut))

ggplot(diamonds, aes(y = carat, x = 1)) + geom_boxplot()
ggplot(diamonds, aes(y = carat, x = cut)) + geom_boxplot()

ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin()
g <- ggplot(diamonds, aes(y = carat, x = cut))
g + geom_point() + geom_violin()
g + geom_violin() + geom_point()
g + geom_jitter() + geom_violin()

# line plot
head(economics)
ggplot(economics, aes(x = date, y = pop)) + geom_line()
library(lubridate)
economics$year <- year(economics$date)
economics$month <- month(economics$date)

econ2000 <- economics[which(economics$year >= 2000), ]
nrow(economics)
nrow(econ2000)

head(econ2000)
econ2000$month <- month(econ2000$date, label = TRUE)
head(econ2000)

library(scales)
g <- ggplot(econ2000, aes(x = month, y = pop))
g <- g + geom_line(aes(color = factor(year), group = year))
g
g <- g + scale_color_discrete(name = "Year")
g
g <- g + scale_y_continuous(labels = comma)
g <- g + labs(title = "Population Growth", x = "Month", y = "Population")
g
g <- g +  theme(axis.text.x = element_text(angle = 90, hjust = 1))
g
