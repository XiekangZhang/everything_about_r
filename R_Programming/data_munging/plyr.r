require(plyr)
# ddply, llply, dlply, adply
head(baseball)
baseball$sf[baseball$year < 1954] <- 0
any(is.na(baseball$sf))

baseball$hbp[is.na(baseball$hbp)] <- 0
any(is.na(baseball$hbp))

baseball <- baseball[baseball$ab >= 50, ]
# don't use attach detach
baseball$OBP <- with(baseball, (h + bb + hbp) / (ab + bb + hbp + sf))
tail(baseball)

obp <- function(data) {
    # average weighted
    c(OBP = with(data, sum(h + bb + hbp) / sum(ab + bb + hbp + sf)))
}

careerOBP <- ddply(baseball, .variables = "id", obp)
head(careerOBP)
careerOBP <- careerOBP[order(careerOBP$OBP, decreasing = TRUE), ]
head(careerOBP)

theList <- list(A = matrix(1:9, 3), B = 1:5, C = matrix(1:4, 2), D = 2)
theList
lapply(theList, sum)
llply(theList, sum)
identical(lapply(theList, sum), llply(theList, sum))

sapply(theList, sum) # with vector name
laply(theList, sum) # no vector name

head(diamonds)
aggregate(price ~ cut, diamonds, each(mean, median))

# colwise calculation
numcolwise(sum, na.rm = TRUE)(diamonds)
sapply(diamonds[, sapply(diamonds, is.numeric)], sum)


ddply(diamonds, "cut", summarise, Price = mean(price))
daply(diamonds, "cut", summarise, Price = mean(price))
