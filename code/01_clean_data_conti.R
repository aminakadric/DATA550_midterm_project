here::i_am(
  "code/01_clean_data_conti.R"
)

absolute_path_to_data <- here::here("data", "f75_interim.csv")
f75 <- read.csv(absolute_path_to_data, header = TRUE)

library(tidyverse)

# filter for children who survived to stabilization
data_clean_conti <- f75 |> 
  filter(days_stable != 999)

# check missing values
# for agemons
sum(is.na(data_clean_conti$agemons)) # 0
# for height
sum(is.na(data_clean_conti$height)) # 1
# for weight 1
sum(is.na(data_clean_conti$weight1)) # 2

# only 3 NAs so decided to drop them
data_clean_conti <- data_clean_conti |>
  filter(!is.na(height) & !is.na(weight1))

# check if there are still missing values
sum(is.na(data_clean_conti$height)) # 0
sum(is.na(data_clean_conti$weight1)) # 0

saveRDS(
  data_clean_conti,
  file = here::here("data", "data_clean_conti.rds")
)