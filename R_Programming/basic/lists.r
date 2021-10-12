# creates a three element list
list(1, 2, 3)

# creates a single element list
list(c(1, 2, 3))

# creates a two element list
list3 <- list(c(1, 2, 3), 3:7)

list4 <- list(the_df, 1:10, list3)
list4
names(list4) <- c("data.frame", "vector", "list")
list4
list5 <- list(TheDataFrame = the_df, TheVector = 1:10, TheList = list3)
list5

# empty list
empty_list <- vector(mode = "list", length = 4)

# add a fourth element
list5[[4]] <- 2
list5$new_element <- 3:6
list5
