library(tidyverse)
library(crayon)

load("data/color_lego.rda")
load("data/list_lego.rda")

## colorlego function ----
colorlego <- function(series) {
  color_lego %>%
    filter(color != "#FFFFFF") %>%
    filter(color != "#FCFCFC") %>%
    filter(name == series) %>%
    pull(color) %>%
    unique()
}

colorlego("Basic")

## usage ----
iris %>%
  group_by(Species) %>%
  summarise(Sepal.Length = mean(Sepal.Length)) %>%
  ggplot(aes(Species, Sepal.Length, fill = Species)) +
  geom_col() +
  scale_fill_manual(values = colorlego("Ferrari")[1:3])

## color_lego_show() function ----
color_lego_show <- function(series) {

  x <- colorlego(series)
  font <- make_style("ivory")
  bg <- lapply(x, FUN = function(x) make_style(x, bg = TRUE))

  for (i in 1:length(x)) {
    style <- combine_styles(font, bg[[i]])
    cat(style(x[[i]]), "")
  }
}

color_lego_show(sample(list_lego, 1))
color_lego_show("Ferrari")
