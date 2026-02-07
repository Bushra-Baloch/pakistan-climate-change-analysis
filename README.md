Pakistan Climate Change Analysis
Temperature & CO₂ Trends (1950–2016)
📌 Project Overview

This project analyzes long-term climate trends in Pakistan by examining historical temperature records and CO₂ emissions per capita. The objective is to identify warming patterns and evaluate the statistical relationship between greenhouse gas emissions and temperature changes using R.

The analysis integrates data preprocessing, visualization, statistical modeling, and reproducible workflows to provide data-driven insights into climate dynamics.

🎯 Business / Policy Questions

Has Pakistan’s average annual temperature increased over time?

Have CO₂ emissions per capita increased?

Is there a statistically significant relationship between CO₂ emissions and temperature?

How strong is the association between greenhouse gas emissions and climate trends?

🛠 Tools & Technologies

R

tidyverse (dplyr, ggplot2, readr)

janitor

broom

patchwork

Git & GitHub

📂 Project Structure
Pakistan-Climate-Analysis/
│
├── data/
│   ├── raw/              # Original datasets
│   └── processed/        # Cleaned merged dataset
│
├── outputs/
│   ├── plots/            # Saved visualizations
│   └── models/           # Regression outputs
│
├── scripts/              # Reproducible analysis script
│
└── README.md

🔄 Workflow Summary

Load raw monthly temperature dataset

Aggregate monthly data into annual averages

Load CO₂ emissions dataset

Clean and standardize column names

Merge datasets by year (1950–2016 overlap)

Perform exploratory data analysis (EDA)

Create professional visualizations

Conduct correlation and regression analysis

Save plots and model outputs for reproducibility

📊 Exploratory Data Analysis
📈 Temperature Trend

The annual average temperature shows a consistent upward trend from 1950 to 2016, indicating gradual warming over the study period.

🌍 CO₂ Emissions Trend

CO₂ emissions per capita increased steadily over time, with accelerated growth observed after the 1980s.

🔗 Combined Trend Visualization

The combined visualization illustrates parallel upward trends in both temperature and CO₂ emissions.

📉 Statistical Analysis
📌 Correlation

The Pearson correlation coefficient between CO₂ emissions and temperature is:

0.61 (Moderate Positive Relationship)

This indicates that higher CO₂ emissions are associated with higher average annual temperatures.

📌 Linear Regression Model

Model:

avg_temp_c ~ co2_per_capita


Key findings:

The regression coefficient for CO₂ emissions is positive.

The relationship is statistically significant (p < 0.05).

The model explains a meaningful portion of temperature variation (R² value reported in outputs).

This provides statistical evidence supporting the association between rising CO₂ emissions and temperature increases in Pakistan.

📁 Saved Outputs

climate_data.csv → Cleaned merged dataset

temperature_trend.png → Temperature visualization

co2_trend.png → CO₂ visualization

combined_trend.png → Combined visualization

climate_regression_model.rds → Saved regression model

regression_summary.txt → Model output

regression_results.csv → Tidy regression table

🔬 Reproducibility

The entire analysis is reproducible using:

scripts/climate_analysis.R


To rebuild the project:

Clone the repository

Open the R project file

Run the master script

All plots, models, and processed data will regenerate automatically.

Key Insights

Pakistan has experienced measurable warming from 1950–2016.

CO₂ emissions per capita increased significantly over the same period.

A statistically significant positive relationship exists between emissions and temperature.

Findings align with global climate change research trends.


Other climate drivers (e.g., land use changes, global patterns) are not included.

Data resolution is annual; seasonal variation was not modeled.
