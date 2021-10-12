x <- 10:1
y <- -4:5
q <- c(
    "Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse",
    "Basketball", "Tennis", "Cricket", "Soccer"
)

the_df <- data.frame(x, y, q)
the_df
the_df <- data.frame(First = x, Second = y, Sport = q)
the_df

class(the_df$Sport)
the_df <- data.frame(First = x, Second = y, Sport = q, stringsAsFactors = TRUE)
class(the_df$Sport)

nrow(the_df)
ncol(the_df)
dim(the_df)
nrow(x)
NROW(x) # saftey function as nrow

names(the_df)[3]
rownames(the_df)
rownames(the_df) <- c(
    "One", "Two", "Three", "Four", "Five", "Six", "Seven",
    "Eight", "Nine", "Ten"
)
the_df

head(the_df)
head(the_df, n = 7)
tail(the_df)
class(the_df)

the_df$Sport
the_df[3, 2]
the_df[3, 2:3]
the_df[c(3, 5), 2:3] # [row, col]
the_df[, 3]
the_df[1, ]
the_df[, 3, drop = FALSE] # not down to vector

the_df["Sport"]
the_df[["Sport"]]
