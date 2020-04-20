#' color_lego
#'
#' This function make palette from lego color dataset
#' @param series A series that you want to import the colors. The list of series can find at colorhount::list_lego
#' @keywords color, ggplot2, lego
#' @import rvest
#' @import magrittr
#' @import stringr
#' @import clipr
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

  colors <- colorhunt::lego %>%
    filter(color != "#FFFFFF") %>%
    filter(color != "#FCFCFC") %>%
    filter(name == series) %>%
    pull(color) %>%
    unique()

  if(Sys.info()[1] == "Linux") {
    return(colors)
  } else {
    c <- paste0("c(", toString(colors), "')") %>%
      stringr::str_replace_all("#", "'#") %>%
      stringr::str_replace_all(",", "',")

    clipr::write_clip(c, object_type = "character")
    cat("Colors were copied to your clipboard! Paste (Ctrl + V) the color code into the script! \n")

    return(colors)
  }

}



