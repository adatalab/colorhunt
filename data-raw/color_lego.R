## lego ----

color_lego <- full %>%
  group_by(name.y, rgb) %>%
  summarise(n = sum(quantity)) %>%
  rename(
    series = name.y,
    color = rgb
  ) %>%
  arrange(series, desc(n))

# usethis::use_data(color_lego, internal = TRUE)

