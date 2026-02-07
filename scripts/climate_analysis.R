############################################################
# Pakistan Climate Change Analysis
# Temperature & CO2 Trends (1950–2016)
############################################################

# ===============================
# 1. Load Required Libraries
# ===============================
library(tidyverse)
library(janitor)
library(broom)
library(patchwork)

# ===============================
# 2. Create Required Folders
# ===============================
dir.create("outputs/plots", recursive = TRUE)
dir.create("outputs/models", recursive = TRUE)
dir.create("data/processed", recursive = TRUE)

# ===============================
# 3. Load & Prepare Temperature Data
# ===============================
temp_data <- read_csv("data/raw/Tempreture_1901_2016_Pakistan.csv") %>%
  clean_names()

temp_yearly <- temp_data %>%
  group_by(year) %>%
  summarise(
    avg_temp_c = mean(temperature_celsius, na.rm = TRUE)
  )

# ===============================
# 4. Load & Prepare CO2 Data
# ===============================
co2_data <- read_csv("data/raw/pakistan carbon dioxide emission data.csv") %>%
  clean_names()

co2_clean <- co2_data %>%
  select(year, annual_co2_emissions_per_capita) %>%
  rename(co2_per_capita = annual_co2_emissions_per_capita)

# ===============================
# 5. Merge Datasets
# ===============================
climate_data <- inner_join(temp_yearly, co2_clean, by = "year")

# Save cleaned dataset
write_csv(climate_data, "data/processed/climate_data.csv")

# ===============================
# 6. Visualization
# ===============================

# Temperature plot
temp_plot <- ggplot(climate_data, aes(x = year, y = avg_temp_c)) +
  geom_line(color = "steelblue", linewidth = 1) +
  labs(
    title = "Annual Average Temperature in Pakistan",
    x = "Year",
    y = "Average Temperature (°C)"
  ) +
  theme_minimal()

# CO2 plot
co2_plot <- ggplot(climate_data, aes(x = year, y = co2_per_capita)) +
  geom_line(color = "darkred", linewidth = 1) +
  labs(
    title = "CO2 Emissions Per Capita in Pakistan",
    x = "Year",
    y = "CO2 Emissions (Metric Tons per Capita)"
  ) +
  theme_minimal()

# Combined plot
combined_plot <- temp_plot + co2_plot

# Save plots
ggsave("outputs/plots/temperature_trend.png", temp_plot, width = 8, height = 5, dpi = 300)
ggsave("outputs/plots/co2_trend.png", co2_plot, width = 8, height = 5, dpi = 300)
ggsave("outputs/plots/combined_trend.png", combined_plot, width = 12, height = 5, dpi = 300)

# ===============================
# 7. Statistical Analysis
# ===============================

# Correlation
correlation <- cor(climate_data$avg_temp_c,
                   climate_data$co2_per_capita)

print(paste("Correlation:", correlation))

# Regression model
model <- lm(avg_temp_c ~ co2_per_capita, data = climate_data)

summary(model)

# Save model
saveRDS(model, "outputs/models/climate_regression_model.rds")

# Save regression summary
sink("outputs/models/regression_summary.txt")
summary(model)
sink()

# Save tidy regression results
model_results <- tidy(model)
write_csv(model_results, "outputs/models/regression_results.csv")

############################################################
# END OF SCRIPT
############################################################
