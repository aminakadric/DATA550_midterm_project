# Merge the cleaned data sets and keep variables of interest

library(dplyr)

here::i_am(
  "code/05_merge_clean_data.R"
)

# Read in cleaned continuous data
clean_conti <- readRDS(
  file = here::here("data/data_clean_conti.rds")
)

# Remove NA for breastfeeding, the only missing categorical value of interest
# Keep variables of interest
data_clean_merged <- clean_conti |>
  filter(!is.na(bfeeding)) |>
  select(subjid, arm, sex, bfeeding, agemons, height, weight1)


# Save the data set for analysis 
saveRDS(
  data_clean_merged,
  file = here::here("data", "data_clean_merged.rds")
)

