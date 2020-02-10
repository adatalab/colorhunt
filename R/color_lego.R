#' color_lego
#'
#' This function make palette from lego color dataset
#' @param series A series that you want to import the colors. The list of series can find at colorhount::list_lego
#' @keywords color, ggplot2, lego
#' @import rvest
#' @import magrittr
#' @export
#' @examples
#' colors <- color_lego("Ferrari")
#' mpg %>%
#' group_by(class) %>%
#'   summarise(displ = mean(displ)) %>%
#'   ggplot(aes(reorder(class, displ), displ, fill = class)) +
#'   geom_col() +
#'   scale_fill_manual(values = color_lego("Ferrari"))

color_lego <- function(series) {
  color <- lego %>%
    filter(color != "#FFFFFF") %>%
    filter(color != "#FCFCFC") %>%
    filter(name == series) %>%
    pull(color) %>%
    unique()

  return(color)
}



