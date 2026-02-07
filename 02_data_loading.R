# Load libraries
library(tidyverse)
library(janitor)

# Load temperature data
temp_data <- read_csv("data/raw/Tempreture_1901_2016_Pakistan.csv")

# Clean column names
temp_data <- temp_data %>%
  clean_names()

# Create yearly temperature dataset
temp_yearly <- temp_data %>%
  group_by(year) %>%
  summarise(avg_temp_c = mean(temperature_celsius, na.rm = TRUE))

# Load CO2 data
co2_data <- read_csv("data/raw/pakistan carbon dioxide emission data.csv")

# Clean column names
co2_data <- co2_data %>%
  clean_names()

# Select and rename CO2 column
co2_clean <- co2_data %>%
  select(year, annual_co2_emissions_per_capita) %>%
  rename(co2_per_capita = annual_co2_emissions_per_capita)

# Merge datasets
climate_data <- inner_join(temp_yearly, co2_clean, by = "year")

glimpse(climate_data)

summary(climate_data)

ggplot(climate_data, aes(x = year, y = avg_temp_c)) +
  geom_line(color = "steelblue", linewidth = 1) +
  labs(
    title = "Annual Average Temperature in Pakistan",
    subtitle = "1950–2016",
    x = "Year",
    y = "Average Temperature (°C)"
  ) +
  theme_minimal()
temp_plot <- ggplot(climate_data, aes(x = year, y = avg_temp_c)) +
  geom_line(color = "steelblue", linewidth = 1) +
  labs(
    title = "Annual Average Temperature in Pakistan",
    subtitle = "1950–2016",
    x = "Year",
    y = "Average Temperature (°C)"
  ) +
  theme_minimal()


