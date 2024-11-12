library(here)

here::i_am(
  "code/03_clean_data_cat.R"
)

# Keeping object names consistent (naming conventions from Hayoung)
absolute_path_to_data <- here::here("data", "f75_interim.csv")
f75 <- read.csv(absolute_path_to_data, header = TRUE)

library(tidyverse)

# filter for children who survived to stabilization
data_clean_cat <- f75 |> 
  filter(days_stable != 999)

# check missing values

# for arm (randomization arm)
sum(is.na(data_clean_cat$arm)) # 0

# for sex
sum(is.na(data_clean_cat$sex)) # 0

# for breastfeeding
sum(is.na(data_clean_cat$bfeeding)) # 1


# only 1 NA found, removing from bfeeding

## just want to point out that I used %>% for a pipe (Parth) ##
data_clean_cat <- data_clean_cat %>%
  filter(!is.na(bfeeding))

# checking again for NAs

sum(is.na(data_clean_cat$bfeeding)) # 0 

# Data cleaned and no more NAs, ready to save

saveRDS(
  data_clean_cat,
  file = here::here("data", "data_clean_cat.rds")
)



