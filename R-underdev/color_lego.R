library(tidyverse)
library(crayon)

load("data/lego.rda")
load("data/list_lego.rda")

## color_lego function ----
color_lego <- function(series) {
  color <- lego %>%
    filter(color != "#FFFFFF") %>%
    filter(color != "#FCFCFC") %>%
    filter(name == series) %>%
    pull(color) %>%
    unique()

  return(color)
}

color_lego("Basic")

## usage ----
iris %>%
  group_by(Species) %>%
  summarise(Sepal.Length = mean(Sepal.Length)) %>%
  ggplot(aes(Species, Sepal.Length, fill = Species)) +
  geom_col() +
  scale_fill_manual(values = color_lego("Ferrari")[1:3])

mpg %>%
  group_by(class) %>%
  summarise(displ = mean(displ)) %>%
  ggplot(aes(reorder(class, displ), displ, fill = class)) +
  geom_col() +
  scale_fill_manual(values = color_lego("Ferrari"))

## color_lego_show() function ----
color_lego_show <- function(series) {

  x <- color_lego(series)
  font <- make_style("ivory")
  bg <- lapply(x, FUN = function(x) make_style(x, bg = TRUE))

  for (i in 1:length(x)) {
    style <- combine_styles(font, bg[[i]])
    cat(style(x[[i]]), "")
  }
}

color_lego_show(sample(list_lego, 1))
color_lego_show("Ferrari")
