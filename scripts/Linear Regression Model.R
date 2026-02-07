model <- lm(avg_temp_c ~ co2_per_capita, data = climate_data)

summary(model)

ggplot(climate_data, aes(x = year, y = avg_temp_c)) +
  geom_line(color = "steelblue") +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  theme_minimal()

ggplot(climate_data, aes(x = year, y = avg_temp_c)) +
  geom_line(color = "steelblue") +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  theme_minimal()

list.files("outputs/plots")


dir.create("data/processed", recursive = TRUE)

write_csv(climate_data, "data/processed/climate_data.csv")


scripts/climate_analysis.R
