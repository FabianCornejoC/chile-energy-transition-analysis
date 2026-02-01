# Chile Electricity Matrix Analysis (2016–2024)

End-to-end data analysis and time series forecasting project based on official hourly electricity generation data from Chile, transformed into a monthly analytical dataset for exploratory analysis, visualization and predictive modeling.

This project demonstrates a complete data workflow:

Raw data → SQL ETL → Analytics layer → Power BI dashboard → Python EDA → Time Series Forecasting

## Project Objective

To analyze how Chile’s electricity generation matrix has evolved between 2016 and 2024, focusing on:

Growth of renewable energy (ERNC)

Reduction of conventional generation

Seasonal patterns in generation

Predictability of the system through time series models

## Data Sources

Official hourly electricity generation CSV files (MWh) from Chilean energy authorities.

Challenges in raw data:

Inconsistent date formats (months as text)

Null and empty region names

Decimal separator inconsistencies

Mixed encodings and formatting issues

## Data Engineering Pipeline (PostgreSQL)

A three-layer SQL pipeline was built to ensure data quality and reproducibility.

1️⃣ Staging Layer — generation_hourly_staging

Raw ingestion using COPY

All columns stored as TEXT

No transformations

2️⃣ Raw Typed Layer — generation_hourly_raw

Explicit type casting

Date normalization

Cleaning numeric formats

Preservation of null values

Hourly granularity maintained

3️⃣ Analytics Layer — generation_monthly_analytics

Hourly → Monthly aggregation

Grouped by:

Month

Region

Technology

Energy classification (Conventional / ERNC)

Null handling with COALESCE

Unit conversion: MWh → GWh

Data validation against official regional reports

## Power BI Dashboard

Interactive dashboard built to visualize:

Monthly evolution of electricity generation

Conventional vs Renewable share

Diversification by technology (Solar, Wind, Hydro, Thermal, etc.)

Regional and technological filters

Storytelling and validated metrics in GWh

## Python Analysis (/notebooks)

The second stage of the project focuses on EDA and forecasting using Python.

Exploratory Data Analysis (EDA)

Analysis performed on monthly data:

Long-term trends

Seasonal behavior

Regional and technological comparisons

Renewable share evolution

Seasonal amplitude analysis

Key observation:

Renewable generation shows strong seasonal behavior, especially in summer months.

## Time Series Decomposition

Using additive decomposition:

Generation = Trend + Seasonality + Noise

Findings:

Stable seasonal component over the years

Slow-moving trend

Low noise relative to signal

## Forecasting
Baseline Model — Seasonal Naive

MAE ≈ 92 GWh (~14.8%)

Shows strong seasonal stability of the system

SARIMA Model — (1,0,0) × (1,1,0,12)

Improved performance:

Model Seasonal Naive, MAE = 92 GWh, Relative Error =	14.8%	
	
Model SARIMA, MAE = 57 GWh, Relative Error =	9.2%

This indicates that, beyond seasonality, the system exhibits short-term temporal dependencies captured by SARIMA.

## Forecast by Energy Type

SARIMA applied separately to:

Series	
Total System:	MAE = 57 GWh, Relative Error = 9%
Conventional: MAE =	360 GWh, Relative Errir =	9%
ERNC: MAE =	280 GWh, Relative Error =	9%

Insight:

The predictability of the Chilean electricity system emerges from the stability of its individual components rather than aggregation effects.

## Key Insights

Chile’s electricity matrix is increasingly diversified

Renewable energy contribution has grown steadily since 2016

Strong and stable seasonal patterns exist, especially for ERNC

The system is highly predictable at a monthly level

Simple statistical models provide operationally useful forecasts

📁 Repository Structure
/sql        → ETL pipeline and validation
/docs       → Data model and pipeline documentation
/powerbi    → Final dashboard
/notebooks  → EDA and forecasting analysis

## Tools & Technologies

PostgreSQL (ETL & data modeling)

Power BI (visual analytics)

Python (Pandas, Matplotlib, Statsmodels, Scikit-learn)

Jupyter Notebooks (analysis and modeling)

## What This Project Demonstrates

Data cleaning from imperfect real-world sources

SQL data pipeline design

Analytical data modeling

Data visualization and storytelling

Time series decomposition and forecasting

Model evaluation and interpretation

Reproducible analytical workflow

## Future Improvements

Forecast by region

Inclusion of exogenous variables (temperature, demand)

Comparison with machine learning models

👤 Author

Fabián Cornejo – Physicist transitioning into Data Science.
