library(ggplot2)
data(diamonds)
head(diamonds)

# hist
hist(diamonds$carat)
hist(diamonds$carat, main = "Carat Histogram", xlab = "test")

# plot
# price ~ carat: viewing price against carat, formula interface
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
# take date converts to year
economics$year <- year(economics$date)
economics$month <- month(economics$date)
head(economics)

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
# change the legend factor(year) to year
g <- g + scale_color_discrete(name = "Year")
g
g <- g + scale_y_continuous(labels = comma)
g <- g + labs(title = "Population Growth", x = "Month", y = "Population")
g
# change the anker of x axis
g <- g +  theme(axis.text.x = element_text(angle = 90, hjust = 1))
g


# small multiples
g <- ggplot(diamonds, aes(x = carat, y = price))
# facet_wrap: break up the plot into discrete units, one for each level of color
# and then form these ito a grid
g + geom_point(aes(color = color)) + facet_wrap(~color)
# combination of cut and clarity --> left: goes down, right: goes cross
g + geom_point(aes(color = color)) + facet_grid(cut ~ clarity)
ggplot(diamonds, aes(x = carat)) + geom_histogram() + facet_wrap(~color)

# control colors and shapes
ggplot(
    diamonds,
    aes(
        x = carat, 
        y = price, 
        color = color, 
        shape = cut, 
        size = depth
    )
) +
    geom_point()

# add themes to graphs
# install.packages("ggthemes")
require(ggthemes)
g <- ggplot(diamonds, aes(x = carat, y = price, color = color)) + geom_point()
g + theme_wsj()
g + theme_economist() + scale_color_economist()
g + theme_tufte()
g + theme_excel() + scale_color_excel()

# Use Web graphics
# D3 library
install.packages("ggvis")
require(ggvis)
data(cocaine)
head(cocaine)
require(ggplot2)
ggplot(cocaine, aes(x = weight, y = price)) +
    geom_point()

cocaine %>%
    ggvis(x = ~weight, y = ~price) %>%
    layer_points()
# fill the color itself
# stroke the outlines
cocaine %>% ggvis(x = ~weight, y = ~price, fill = ~potency) %>% layer_points()
cocaine %>%
    ggvis(x = ~weight, y = ~price, stroke = ~potency) %>%
    layer_points()
# ~ mapping, := assigning a value
cocaine %>%
    ggvis(x = ~weight, y = ~price, fill := "green") %>%
    layer_points()

cocaine %>%
    ggvis(x = ~weight, y = ~price, fill = ~potency) %>%
    layer_points() %>%
    layer_smooths()

# easy to create an interactive graph and based on a shiny application
cocaine %>%
    ggvis(~weight, ~price,
        fill = ~potency, size := input_slider(10, 100),
        opacity := input_slider(0, 1)
    ) %>%
    layer_points()

ggplot(cocaine, aes(x = price)) +
    geom_histogram()
cocaine %>% ggvis(x = ~price) %>% layer_histograms()

# rCharts 
install.packages("cli")
install.packages("devtools")
require(devtools)
install_github("ramnathv/rCharts")
require(rCharts)
head(iris)
# replace . with empty
names(iris) <- gsub("\\.", "", names(iris))
head(iris)
rPlot(x = "SepalWidth", y = "SepalLength", facet = "Species",
    color = "Species", type = "point", data = iris
)

# only works on RStudio
data(economics, package = "ggplot2")
economics$date <- as.character(economics$date)
ml <- mPlot(
    x = "date", y = c("psavert", "uempmed"),
    type = "Line", data = economics
)
ml$set(pointSize = 0, linewidth = 1)
ml

map1 <- Leaflet$new()
map1$setView(c(51.505, -.09), zoom = 13)
map1

# practice
install.packages("rjson")
require(rjson)
require(plyr)

# not work
pizzaJson <- fromJSON(file = "https://www.jaredlander.com/data/PizzaPollData.php")
pizzaJson
pizza <- ldply(pizzaJson, function(x) as.data.frame(x))

head(pizza)
pizzaPlot <- nPlot(Percent ~ Place, data = pizza, type = "multiBarChart", group = "Answer")
