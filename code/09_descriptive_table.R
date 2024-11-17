library(gtsummary)
library(tidyverse)
library(boot)
pacman::p_load(rio)

#Create descriptive statistics table
here::i_am(
  "code/09_descriptive_table.R"
)

#Read in merged and cleaned dataset
clean_merged <- readRDS(
  file = here::here("data/data_clean_merged.rds")
)


table_stat <- clean_merged |>
  select(arm, sex, bfeeding, agemons, height, weight1) |>
  tbl_summary(
    by = arm,
    statistic = list(all_categorical() ~ "{n}    ({p}%)",
                     all_continuous()  ~ "{median} ({p25}, {p75})"),
    digits = list(all_continuous()  ~ c(2, 2),
                  all_categorical() ~ c(0, 1)),
    type = list(agemons      ~ "continuous",
                height ~ "continuous",
                weight1   ~ "continuous",
                sex ~ "categorical",
                bfeeding ~ "categorical"),
    label  = list(agemons      ~ "Age (months)",
                  height ~ "Height (cms)",
                  weight1   ~ "Weight (kgs)",
                  sex ~ "Sex",
                  bfeeding ~ "Currently Breastfeeding")
  ) |>
  modify_header(
    label = "**Variable**",
    all_stat_cols() ~ "**{level}**<br>N = {n} ({style_percent(p, digits=1)}%)"
  ) |>
  modify_caption("Participant characteristics, by intervention") %>%
  bold_labels()  |>
  add_overall(
    last = FALSE,
    col_label = "**All Participants**<br>N = {N}"
  )

table_stat

saveRDS(
  table_stat, 
  file = here::here ("output", "descriptive_table.rds"))





