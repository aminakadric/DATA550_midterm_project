here::i_am("code/06_make_boxplot.R")

data_merged <- readRDS(
  file = here::here("data/data_clean_merged.rds")
)

library(ggplot2)

boxplots <- ggplot(data_merged) +
 aes(x = arm, y = weight1) +
 geom_boxplot(fill = "#228B22") +
 labs(x = "Treatment Arm", 
 y = "Weight at Stabilization (kg)", title = "Weight at Stabilization by Treatment Arm", subtitle = "Crude Analysis") +
 theme_bw()

ggsave(
  here::here("output/boxplots.png"),
  plot = boxplots,
  device = "png"
)
