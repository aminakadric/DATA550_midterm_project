# Make the primary and secondary models 

library(gtsummary)
library(broom)
library(dplyr)

here::i_am("code/08_make_models.R")

data_merged <- readRDS(
  file = here::here("data/data_clean_merged.rds")
)

data_merged <- data_merged |>
  rename(
    "Randomization Arm" = arm,
    "Age (months)" = agemons,
    "Sex" = sex,
    "Height (cm)" = height,
    "Breastfeeding Status" = bfeeding,
    "Weight (kg)" = weight1
  )

primary_model <- glm(
  `Weight (kg)` ~ `Randomization Arm` + `Age (months)` + `Sex` + `Height (cm)` + `Breastfeeding Status`,
  data = data_merged
)

primary_regression_table <- tbl_regression(primary_model) |>
  modify_caption("**Linear Regression**") |>
  bold_labels() |>
  add_global_p()


config_list <- config::get()

secondary_model <- glm(
  I(`Weight (kg)` > config_list$cutpoint) ~ `Randomization Arm` + `Age (months)` + `Sex` + `Height (cm)` + `Breastfeeding Status`,
  data = data_merged,
  family = binomial()
)

secondary_regression_table <- 
  tbl_regression(secondary_model, exponentiate = TRUE) |>
  modify_caption("**Logistic Regression**") |>
  bold_labels() |>
  add_global_p()

both_regression_tables <- list(
  primary = primary_regression_table,
  secondary = secondary_regression_table
)

saveRDS(
  both_regression_tables,
  file = here::here("output", "both_regression_tables")
)
