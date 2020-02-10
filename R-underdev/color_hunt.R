library(rvest)
library(ggplot2)
library(crayon)

# You can get the url from https://dribbble.com/

## colorhunt function ----
color_hunt <- function(url) {

  colors <- url %>%
    read_html() %>%
    html_nodes(".color") %>%
    html_children() %>%
    html_text()

  return(colors)
}

## usage ----
colors <- color_hunt("https://dribbble.com/shots/6393225-Iris")

iris %>%
  ggplot(aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  scale_color_manual(values = colors[-1]) +
  theme(
    panel.background = element_rect(fill = colors[1])
  )

## color_hunt_show function ----
color_hunt_show <- function(url) {

  x <- color_hunt(url)
  font <- make_style("black")
  bg <- lapply(x, FUN = function(x) make_style(x, bg = TRUE))

  for (i in 1:length(x)) {
    style <- combine_styles(font, bg[[i]])
    cat(style(x[[i]]), "")
  }
}

color_hunt_show("https://dribbble.com/shots/8427177-just-chillin")
color_hunt("https://dribbble.com/shots/9912399-Loading-Icon-Payment-App") %>% pals::pal.bands() # OR using pals::pal.bands()

## scale_*_hunt ----
scale_color_hunt <- function(url) {
  colors <- scale_color_manual(values = color_hunt(url))
  colors
}

iris %>%
  ggplot(aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  scale_color_hunt("https://dribbble.com/shots/6393225-Iris")
