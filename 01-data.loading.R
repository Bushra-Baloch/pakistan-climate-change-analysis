############################################################
# Project: Pakistan Climate Change Analysis
############################################################
# Pakistan Climate Change Analysis
# Temperature & CO2 Trends
############################################################

# -----------------------------
# 1. Load Required Libraries
# -----------------------------
library(tidyverse)
library(janitor)

# -----------------------------
# 2. Load Temperature Data
# -----------------------------
temp_data <- read_csv("data/raw/Tempreture_1901_2016_Pakistan.csv")

# Clean column names
temp_data <- temp_data %>%
  clean_names()

# Convert monthly data to yearly average
temp_yearly <- temp_data %>%
  group_by(year) %>%
  summarise(
    avg_temp_c = mean(temperature_celsius, na.rm = TRUE)
  )

# -----------------------------
# 3. Load CO2 Data
# -----------------------------
co2_data <- read_csv("data/raw/pakistan carbon dioxide emission data.csv")

# Clean column names
co2_data <- co2_data %>%
  clean_names()

# Select only needed columns and rename
co2_clean <- co2_data %>%
  select(year, annual_co2_emissions_per_capita) %>%
  rename(co2_per_capita = annual_co2_emissions_per_capita)

# -----------------------------
# 4. Merge Datasets
# -----------------------------
climate_data <- inner_join(temp_yearly, co2_clean, by = "year")

# Quick check
glimpse(climate_data)
summary(climate_data)

# -----------------------------
# 5. Temperature Trend Plot
# -----------------------------
temp_plot <- ggplot(climate_data, aes(x = year, y = avg_temp_c)) +
  geom_line(color = "steelblue", linewidth = 1) +
  labs(
    title = "Annual Average Temperature in Pakistan",
    subtitle = "1950–2016",
    x = "Year",
    y = "Average Temperature (°C)"
  ) +
  theme_minimal()

# Save plot
ggsave(
  "outputs/plots/temperature_trend.png",
  plot = temp_plot,
  width = 8,
  height = 5,
  dpi = 300
)

# -----------------------------
# 6. CO2 Trend Plot
# -----------------------------
co2_plot <- ggplot(climate_data, aes(x = year, y = co2_per_capita)) +
  geom_line(color = "darkred", linewidth = 1) +
  labs(
    title = "CO2 Emissions Per Capita in Pakistan",
    subtitle = "1950–2016",
    x = "Year",
    y = "CO2 Emissions (Metric Tons per Capita)"
  ) +
  theme_minimal()

# Save plot
ggsave(
  "outputs/plots/co2_trend.png",
  plot = co2_plot,
  width = 8,
  height = 5,
  dpi = 300
)

# -----------------------------
# 7. Correlation
# -----------------------------
correlation <- cor(climate_data$avg_temp_c,
                   climate_data$co2_per_capita)

print(paste("Correlation between Temperature and CO2:", correlation))

# -----------------------------
# 8. Scatter Plot with Regression Line
# -----------------------------
scatter_plot <- ggplot(climate_data, aes(x = co2_per_capita, y = avg_temp_c)) +
  geom_point(color = "purple", size = 2) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(
    title = "Relationship Between CO2 and Temperature",
    x = "CO2 Per Capita",
    y = "Average Temperature (°C)"
  ) +
  theme_minimal()

ggsave(
  "outputs/plots/co2_vs_temperature.png",
  plot = scatter_plot,
  width = 8,
  height = 5,
  dpi = 300
)

# -----------------------------
# 9. Linear Regression Model
# -----------------------------
model <- lm(avg_temp_c ~ co2_per_capita, data = climate_data)

summary(model)


temp_plot
co2_plot <- ggplot(climate_data, aes(x = year, y = co2_per_capita)) +
  geom_line(color = "darkred", linewidth = 1) +
  labs(
    title = "CO2 Emissions Per Capita in Pakistan",
    x = "Year",
    y = "CO2 Emissions (Metric Tons per Capita)"
  ) +
  theme_minimal()

co2_plot
dir.create("outputs/plots", recursive = TRUE)


ggsave(
  filename = "outputs/plots/co2_trend.png",
  plot = co2_plot,
  width = 8,
  height = 5,
  dpi = 300
)

combined_plot
ggsave(
  filename = "outputs/plots/temperature_co2_combined.png",
  plot = combined_plot,
  width = 12,
  height = 5,
  dpi = 300
)

