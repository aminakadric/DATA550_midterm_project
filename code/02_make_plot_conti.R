here::i_am("code/02_make_plot_conti.R")

data <- readRDS(
  file = here::here("data/data_clean_conti.rds")
)

library(ggplot2)

# agemons
plot_agemons <- 
  ggplot(data, aes(x = agemons)) +
  geom_histogram(binwidth = 5) +
  labs(title = "Histogram of agemons",
       x = "Age in Months (at baseline)",
       caption = "Due to the presence of outliers it's hard to see the exact age distribution, 
       so we created another plot without them below.") +
  theme(plot.caption = element_text(hjust = 0.5, size = 10),
        plot.margin = margin(t = 10, r = 20, b = 20, l = 20))

ggsave(
  here::here("output/plot_agemons.png"),
  plot = plot_agemons,
  device = "png"
)

# agemons w/o 3 outliers
plot_agemons_out <- 
  ggplot(data, aes(x = agemons)) +
  geom_histogram(binwidth = 2) +
  coord_cartesian(xlim = c(0, 97)) +
  labs(title = "Histogram of agemons (without 3 outliers)",
       x = "Age in Months (at baseline)",
       caption = "Most of the children are younger than 25 months, especially betwen 0 to 15 months,
       with a strongly right-skewed distribution, meaning the number decreases as age increases.") +
  theme(plot.caption = element_text(hjust = 0.5, size = 10),
        plot.margin = margin(t = 10, r = 20, b = 20, l = 20))

ggsave(
  here::here("output/plot_agemons_out.png"),
  plot = plot_agemons_out,
  device = "png"
)

# height
plot_height <- 
  ggplot(data, aes(x = height)) +
  geom_histogram(binwidth = 3) +
  labs(title = "Histogram of height",
       x = "Height/Length at baseline (in cm)",
       caption = "Most children have a height/length between 60 and 80cm at baseline, 
       with fewer children at both shorter and taller heights.") +
  theme(plot.caption = element_text(hjust = 0.5, size = 10),
        plot.margin = margin(t = 10, r = 20, b = 20, l = 20))

ggsave(
  here::here("output/plot_height.png"),
  plot = plot_height,
  device = "png"
)

# weight1
plot_weight1 <- 
  ggplot(data, aes(x = weight1)) +
  geom_histogram() +
  labs(title = "Histogram of weight1",
       x = "Weight at Stabilization (in kg)",
       caption = "Due to the presence of outliers it's hard to see the exact weight1 distribution, 
       so we created another plot without them below.") +
  theme(plot.caption = element_text(hjust = 0.5, size = 10),
        plot.margin = margin(t = 10, r = 20, b = 20, l = 20))

ggsave(
  here::here("output/plot_weight1.png"),
  plot = plot_weight1,
  device = "png"
)

# weight1 w/o an outlier
plot_weight1_out <-
  ggplot(data, aes(x = weight1)) +
  geom_histogram(binwidth = 0.3) +
  coord_cartesian(xlim = c(0, 15)) +
  labs(title = "Histogram of weight1 (without 1 outlier)",
       x = "Weight at Stabilization (in kg)",
       caption = "At stabilization, the weight of most children falls between 5 and 8kg, 
       with a right-skewed distribution.") +
  theme(plot.caption = element_text(hjust = 0.5, size = 10),
        plot.margin = margin(t = 10, r = 20, b = 20, l = 20))

ggsave(
  here::here("output/plot_weight1_out.png"),
  plot = plot_weight1_out,
  device = "png"
)