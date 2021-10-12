download.file("HTTP://www.jaredlander.com/data/ExcelExample.xlsx",
    destfile = "R_Programming_Resources/ExcelExample.xlsx",
    mode = "wb"
) # wb stands for binary files

install.packages(c("readxl", "openxlsx"))
library(readxl)
tomatoxl <- read_excel("R_Programming_Resources/ExcelExample.xlsx", sheet = 1)
head(tomatoxl)

winexl <- read_excel("R_Programming_Resources/ExcelExample.xlsx",
    sheet = "Wine"
)
head(winexl)

library(openxlsx)
tomatoxl1 <- read.xlsx("R_Programming_Resources/ExcelExample.xlsx", sheet = 1)
head(tomatoxl1)
