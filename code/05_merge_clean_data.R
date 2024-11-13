# Merge the cleaned data sets and keep variables of interest

library(dplyr)

here::i_am(
  "code/05_merge_clean_data.R"
)

# Read in cleaned categorical data
clean_cat <- readRDS(
  file = here::here("data/data_clean_cat.rds")
)

# Read in cleaned continuous data 
clean_conti <-  readRDS(
  file = here::here("data/data_clean_conti.rds")
)

# Keep categorical variables of interest
cat_data <- clean_cat |>
  select(subjid, arm, sex, bfeeding)

# Keep continuous variables of interest 
conti_data <- clean_conti |>
  select(subjid, agemons, height, weight1)

# Merge the cleaned data
data_clean_merged <- left_join(cat_data, conti_data, by = "subjid")

# Save the data set for analysis 
saveRDS(
  data_clean_merged,
  file = here::here("data", "data_clean_merged.rds")
)

