say.hello <- function() {
    print("Hello, World!")
    sprintf("hello %s, today is %s", "Xk", "Saturday")
}
say.hello()

# with argument
# . is just another character and has no special meaning here
# .name --> the parameter is accessible but not invisible
hello.person <- function(name) {
    sprintf("Hello %s", name)
}
hello.person("Xk")
hello.person("Bob")

hello.person <- function(first, last="test") {
    sprintf("Hello %s %s", first, last)
}

hello.person("Xk", "Zhang")
hello.person("Xk")

hello.person <- function(first, last="Doe", ...) {
    sprintf("Hello %s %s", first, last)
}

hello.person("Jared", "Ladnder", "Goodbye")
hello.person("Jared", extra = "Goodbye")

# with return
double.num <- function(x) {
    x * 2
    x + 44 # return the last statement
}
double.num(3)
double.num(5)

# docall
hello.person("Jared", "Lander")
do.call(hello.person, args = list(first = "Jared", last = "Lander"))

run.this <- function(x, func = mean) {
    do.call(func, args = list(x))
}
run.this(1:10)
run.this(1:10, sum)
run.this(1:10, sd)

# if statement
toCheck <- 1
if (toCheck == 1) {
    print("hello")
}

check.bool <- function(x) {
    if (x == 1) {
        print("Hello")
    } else if (x == 0) {
        print("Good Bye")
    } else {
        print("Confused")
    }
}
check.bool(1)
check.bool("bbbb")
check.bool(0)

# switch
use.switch <- function(x) {
    switch(x,
        "a" = "first",
        "b" = "second",
        "z" = "last",
        "c" = "third",
        "other"
    )
}
use.switch("a")
use.switch("b")
use.switch("c")
use.switch("d")
use.switch(2)
use.switch(3)

# check on entire vectors
ifelse(1 == 1, "yes", "no")

toTest <- c(1, 1, 0, 1, 0, 1)
ifelse(toTest == 1, "yes", "no")
ifelse(toTest == 1, toTest * 3, toTest)
ifelse(toTest == 1, toTest * 3, "Zero")
toTest[2] <- NA
toTest
ifelse(toTest == 1, toTest * 3, "Zero")

# compound statements
a <- c(1, 1, 0, 1)
b <- c(2, 1, 0, 1)
ifelse(a == 1 & b == 1, "Yes", "No")
ifelse(a == 1 && b == 1, "Yes", "No")
ifelse(b == 1, "Hi", ifelse(b == 0, "Hello", "Goodbye"))

# iterate with a for loop
for (i in 1:10) {
    print(i)
}
fruit <- c("apple", "banana", "pomegranate")
fruitLength <- rep(NA, length(fruit))
names(fruitLength) <- fruit
fruitLength

for (a in fruit) {
    fruitLength[a] <- nchar(a)
}
fruitLength
a
fruitLength2 <- nchar(fruit)
names(fruitLength2) <- fruit
fruitLength2
identical(fruitLength, fruitLength2)

# while loop
x <- 1
while (x <= 5) {
    print(x)
    x <- x + 1
}

# break and next
for (i in 1:10) {
    if (i == 3) {
        next
    }
    print(i)
}

for (i in 1:10) {
    if (i == 4) {
        break
    }
    print(i)
}
