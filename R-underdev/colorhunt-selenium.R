library(rvest)
library(RSelenium)

## Selenuim setting ----
ch <- wdman::chrome(port = 4445L)
remDr = remoteDriver(
  remoteServerAddr="localhost",
  port=4445L,
  browserName="chrome")

remDr$open()
remDr$getStatus()

## rvest
url <- paste0("https://colorhunt.co/palette/170829")

remDr$navigate(url)

html <- remDr$getPageSource()[[1]] %>%
  read_html() %>%
  html_nodes(".palette") %>%
  html_children() %>%
  html_text()

library(ggplot2)
iris %>%
  ggplot(aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  scale_color_manual(values = html[9:12]) +
  ggthemes::theme_clean()

## Close ----
remDr$close()
