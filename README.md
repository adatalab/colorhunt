# colorhunt
The package scraping the color code from https://dribbble.com/, then generate the palette for 'ggplot2'.

## Installration
```
remotes::install_github("adatalab/colorhunt")
```

## Usage
### First Step
Find the colors for your ggplot2 plot at https://dribbble.com/. For example, I found the `iris` images at https://dribbble.com/shots/6393225-Iris

![](dribbble.png)

### color_hunt()
Import the colors from dribbble!
```
colors <- color_hunt(url = "https://dribbble.com/shots/6393225-Iris")

iris %>%
  ggplot(aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  scale_color_manual(values = colors[-1]) +
  theme(
    panel.background = element_rect(fill = colors[1])
  )
```
![](iris.png)

### color_lego()
This function make palette from the color dataset from 379 LEGO series. `list_lego` shows the list of LEGO series.

```
colors <- color_lego("Ferrari")
mpg %>%
group_by(class) %>%
  summarise(displ = mean(displ)) %>%
  ggplot(aes(reorder(class, displ), displ, fill = class)) +
  geom_col() +
  scale_fill_manual(values = color_lego("Ferrari"))
```

![](lego.png)
