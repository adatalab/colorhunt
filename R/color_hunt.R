#' color_hunt
#'
#' This function make palette from https://dribbble.com/
#' @param url A url that you want to import the colors.
#' @keywords color, ggplot2, dribbble
#' @import rvest
#' @import dplyr
#' @import xml2
#' @import magrittr
#' @import stringr
#' @export
#' @examples
#' library(ggplot2)
#' library(dplyr)
#' colors <- color_hunt("https://dribbble.com/shots/6393225-Iris")
#' iris %>%
#' ggplot(aes(Sepal.Length, Sepal.Width, color = Species)) +
#' geom_point(size = 2) +
#' scale_color_manual(values = colors[-1]) +
#' theme(
#'   panel.background = element_rect(fill = colors[1])
#' )

color_hunt <- function(url) {

  if(!stringr::str_detect(url, "dribbble.com")) {
    stop("Please insert the URL from https://dribbble.com/shots/")
  }

  colors <- url %>%
    read_html() %>%
    html_nodes(".color") %>%
    html_children() %>%
    html_text()

  return(colors)
}
