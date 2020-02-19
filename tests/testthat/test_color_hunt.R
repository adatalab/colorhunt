library(testthat)
library(colorhunt)

test_that(
  "color_hunt()",
  expect_equal(
    color_hunt(url = "https://dribbble.com/shots/6393225-Iris"),
    c("#FFFAEB", "#538F6D", "#BA680D", "#E99E29", "#FDE75C", "#2F545F", "#CBC4C3", "#6D8A96")
  )
)
