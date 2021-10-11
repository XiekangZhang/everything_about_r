# vectors could be understood as array
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
x
x * 3
x + 2
x - 3
x / 4
x ^ 2
sqrt(x)
1:10
10:1
-2:3
5:-7

x <- 1:10
y <- -5:4
x + y
x - y # elementary operation
length(x)

x + c(1, 2, 3) # 1+1, 2+2, 3+3, 4+1 ...
x <= 5
x > y
any(x < y)
all(x < y)

q <- c("Hockey", "Football", 3)
q
nchar(q)

x[1] # first element - index starts with 1
x[1:3]
x[c(1, 6)]

c(One = "a", Two = "y", Last = "r") #  name a vector
w <- 1:3
names(w) <- c ("a", "b", "c")
w
w["a"]
w["b"]

q2 <- c(q, "Hockey", "Lacrosse", "Hockey", "Water Polo", "Hockey", "Lacrosse")
q2
factor(q2)
z <- c(1, 2, NA, 8, 3, NA, 3)
is.na(z)
zChar <- c("Hockey", NA, "Lacrosse")
zChar
is.na(zChar)

z <- c(1, NULL, 3)
z
