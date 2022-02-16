data(diamonds, package = "ggplot2")
head(diamonds)
class(diamonds)

library(dplyr)
dia <- tibble::as_tibble(diamonds)
dia
class(dia)

# select to choose columns
dia[, c("carat", "price")]

dia %>% select(carat, price)
dia %>% select("carat", "price")
dia %>% select(1, 7)
dia %>% select(-c(1, 7))
dia %>% select(-carat, -price)

# filter rows
dia[dia$cut == "Ideal", ]
dia %>% filter(cut == "Ideal")
dia %>% filter(cut == "Ideal", color == "E")
dia %>% filter(cut == "Ideal" & color == "E")

dia %>% filter(cut == "Ideal" | cut == "Premium")
dia %>% filter(cut %in% c("Ideal", "Premium"))

# slice rows
dia %>% slice(1:5)
dia %>% slice(1:10)
dia %>% slice(c(1, 3, 5:10))

# change or create columns
dia %>% mutate(price / carat)
dia %>% mutate(ratio = price / carat) # no change the data source
dia
library(magrittr)
dia %<>% mutate(ratio = price / carat) # change the data source
dia

dia %>% mutate(TotalSize = x + y + z, TwiceSize = TotalSize * 2)

# quick computation
dia %>% summarise(mean(price))
dia %>% summarise(AvgPrice = mean(price))

# group_by
dia %>% group_by(cut) %>% summarise(AvgPrice = mean(price))
dia %>% group_by(cut, color) %>% summarise(AvgPrice = mean(price))
dia %>%
    group_by(cut) %>%
    summarise(
        AvgPrice = mean(price),
        AvgCarat = mean(carat),
        TotalCarat = sum(carat)
    )

# apply arbitrary functions
topN <- function(x, N = 5) {
    x %>% arrange(desc(price)) %>% slice(1:N)
}

topN(dia)
dia %>% do(topN(.))
dia %>% do(topN(., N = 7))
dia %>% group_by(cut) %>% do(topN(., N = 2))

dia %>% group_by(cut) %>% arrange(desc(price)) %>% slice(1:2)

dia %>% group_by(cut) %>% do(This=topN(., N = 2))
models <- dia %>% group_by(cut) %>% do(Model = lm(price ~ carat, data = .))
models
class(models)
class(models$cut)
class(models$Model)
class(models$Model[[1]])
models$Model[[1]]
summary(models$Model[[1]])
