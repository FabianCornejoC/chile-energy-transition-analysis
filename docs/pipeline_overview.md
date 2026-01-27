# Data Pipeline Overview

The project implements a layered data pipeline designed to ensure data quality, reproducibility, and analytical usability.

## 1. Data Sources
Publicly available Chilean energy generation datasets were used, covering the period 2016–2024. Data is provided at an hourly granularity and includes generation by power plant, technology type, energy classification (renewable vs conventional), and region.

## 2. Pre-Ingestion Standardization
Before ingestion, source files were standardized to ensure a consistent schema across all years. This included:

Normalizing date formats to full calendar dates (DD-MM-YYYY)

Converting formula-based fields into static values

Ensuring a homogeneous column structure across all input files

## 3. Staging Layer
The staging layer stores raw ingested data with all fields defined as TEXT. This layer reflects the original data structure and is never modified after ingestion.

## 4. Raw (Typed) Layer
Data from staging is transformed into a typed raw table. This layer applies:

Explicit data type casting

Date normalization

Numeric value cleaning
No business logic or analytical assumptions are applied at this stage.

## 5. Analytics Layer
The analytics layer contains curated datasets optimized for analysis and visualization. Transformations include:

Aggregation of hourly data into monthly values

Grouping by region, technology, and energy classification

Controlled handling of missing values using COALESCE

Monthly dates represented using the first day of each month (DATE_TRUNC('month'))

## 6. Data Validation
Data quality checks were performed to ensure pipeline correctness, including:

Structural validation of data types and date ranges

Null value analysis

Cross-layer aggregation validation comparing total hourly energy against monthly aggregates
Total energy values match exactly between raw and analytics layers, confirming correct aggregation logic.

##### The analytics layer applies controlled handling of missing values for both numerical and categorical fields.

## 7. Reproducibility
The full ingestion, transformation, and aggregation process is implemented in SQL and can be reproduced end-to-end by executing the pipeline scripts.

## 8. Output and Usage
The final analytics tables serve as the data foundation for downstream analysis, visualization (Power BI), and future modeling efforts.
