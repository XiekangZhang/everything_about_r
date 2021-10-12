install.packages("XML")
library(XML)
the_url <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
the_table <- readHTMLTable(the_url,
    which = 1,
    header = FALSE,
    stringAsFactors = FALSE
)
the_url

address <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
the_page <- readLines(address)
page_render <- htmlParse(the_page)
page_render
address <- xpathApply(page_render, "//table[@class='post-']", fun = xmlValue)
address

install.packages("rvest")
library(rvest)
ribalta <- read_html("http://www.jaredlander.com/data/ribalta.html")
class(ribalta)
ribalta %>% html_nodes("ul") %>% html_nodes("span")
ribalta %>% html_nodes(".street") # get all the information with html tags
ribalta %>% html_nodes(".street") %>% html_text()
ribalta %>%
    html_nodes("#longitude") %>%
    html_attr("value")
# to get value out of an attribute
ribalta %>%
    html_nodes("table.food-items") %>%
    magrittr::extract2(5) %>%
    html_table()
