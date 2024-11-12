here::i_am(
  "code/04_make_plot_cat.R"
)

data_for_plots <- readRDS(
  file = here::here("data/data_clean_cat.rds")
)

library(ggplot2)

# Bar plot for randomization arm
plot_arm <- ggplot(
  data_for_plots, aes(x = arm, fill = arm)) +
  geom_bar(width = 0.30) +
  labs(title = "Barplot of Randomization Arm",
       x = "Type of Randomization Arm",
       y= "Count",
       fill = "Randomization Arm",
       caption = "A barplot was created to display the distribution of the 
       trial arms. It can be seen that both arms have a similar count of ~225") +
  theme(plot.caption = element_text(hjust = 0.5, size = 10),
  plot.margin = margin(t = 10, r = 20, b = 20, l = 20)) 

ggsave(
  here::here("output/plot_arms.png"),
  plot = plot_arm,
  device = "png"
)

# Bar plot for sex
plot_sex <- ggplot(
  data_for_plots, aes(x = sex, fill = sex)) +
  geom_bar(width = 0.30) +
  labs(title = "Cohort Composition by Sex",
       x = "Sex",
       y= "Count",
       fill = "Sex",
       caption = "A barplot was created to display the distribution of the 
       sex. There are more males than females in the cohort") +
  theme(plot.caption = element_text(hjust = 0.5, size = 10),
        plot.margin = margin(t = 10, r = 20, b = 20, l = 20)) 

ggsave(
  here::here("output/plot_sex.png"),
  plot = plot_sex,
  device = "png"
)



# Bar plot for breastfeeding variable
plot_bfeeding <- ggplot(
  data_for_plots, aes(x = bfeeding, fill = bfeeding)) +
  geom_bar(width = 0.30) +
  labs(title = "Breastfeeding Status Among Children in the Cohort",
       x = "Breastfeeding Status",
       y= "Count",
       fill = "Breastfeeding Status",
       caption = "A barplot was created to illustrate how many children are 
       still breastfeeding in the cohort. It can be seen that over 200 children
       are still breastfeeding.") +
  theme(plot.caption = element_text(hjust = 0.5, size = 10),
        plot.margin = margin(t = 10, r = 20, b = 20, l = 20))

ggsave(
  here::here("output/plot_bfeeding.png"),
  plot = plot_bfeeding,
  device = "png"
)


