#' color_lego_show
#'
#' This function shows the colors of palette from lego color dataset
#' @param series A series that you want to import the colors. The list of series can find at colorhount::list_lego
#' @keywords color, ggplot2, lego
#' @import crayon
#' @import magrittr
#' @import dplyr
#' @export
#' @examples
#' color_lego_show("Ferrari")
#' color_lego_show(sample(list_lego, 1))

color_lego_show <- function(series) {

  x <- color_lego(series)
  font <- make_style("ivory")
  bg <- lapply(x, FUN = function(x) make_style(x, bg = TRUE))

  for (i in 1:length(x)) {
    style <- combine_styles(font, bg[[i]])
    cat(style(x[[i]]), "")
  }
}

