########################################################################################################################
# Project: Pakistan Climate Change Analysis
# Author: Bushra Baloch
# Date: 2026
# Tool: R
# Description:
# This project analyzes long-term temperature and CO2 trends
# in Pakistan to understand climate change patterns.

install.packages(c(
  "tidyverse",
  "lubridate",
  "janitor",
  "skimr",
  "ggthemes",
  "patchwork",
  "broom",
  "shiny"
))



library(tidyverse)
library(lubridate)
library(janitor)
library(skimr)
library(ggthemes)
library(patchwork)
library(broom)


library(tidyverse)

temp_data <- read_csv("data/raw/Tempreture_1901_2016_Pakistan.csv")

library(tidyverse)

library(tidyverse)
library(janitor)


############################################################
# Script: 03_data_loading.R
# Purpose: Load Pakistan climate datasets
############################################################

# Load libraries
library(tidyverse)
library(janitor)

# Load temperature dataset
temp_data <- read_csv("data/raw/Tempreture_1901_2016_Pakistan.csv")

# View structure
glimpse(temp_data)


# Clean column names
temp_data <- temp_data %>%
  clean_names()

colnames(temp_data)


# Create yearly average temperature
temp_yearly <- temp_data %>%
  group_by(year) %>%
  summarise(
    avg_temperature = mean(temperature_celsius, na.rm = TRUE)
  )

# View result
glimpse(temp_yearly)



# Load CO2 dataset
co2_data <- read_csv("data/raw/pakistan carbon dioxide emission data.csv")

# Clean column names
co2_data <- co2_data %>%
  clean_names()

# Inspect structure
glimpse(co2_data)



co2_data <- co2_data %>%
  filter(country == "Pakistan")

glimpse(co2_data)

co2_clean <- co2_data %>%
  select(year, value) %>%
  rename(co2_emissions = value)


colnames(co2_data)

glimpse(co2_data)

# Select only required columns
co2_clean <- co2_data %>%
  select(year, annual_co2_emissions_per_capita) %>%
  rename(co2_per_capita = annual_co2_emissions_per_capita)

# Check structure
glimpse(co2_clean)





co2_clean <- co2_data %>%
  select(year, annual_co2_emissions_per_capita) %>%
  rename(co2_per_capita = annual_co2_emissions_per_capita)

colnames(co2_data)

"Average Monthly Temperature in Celsius"
avg_temp_c


temp_yearly <- temp_yearly %>%
  rename(avg_temp_c = avg_temperature)

colnames(temp_yearly)


# Merge temperature and CO2 datasets
climate_data <- temp_yearly %>%
  inner_join(co2_clean, by = "year")

# Check structure
glimpse(climate_data)

range(climate_data$year)
glimpse(climate_data)
summary(climate_data)

glimpse(climate_data)
summary(climate_data)


glimpse(climate_data)

