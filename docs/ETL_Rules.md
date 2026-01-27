# Transformation Rules

## Overview
This document describes the rules used to transform raw electricity generation and consumption data into monthly analytical tables.

## Generation Data

### Temporal Normalization
Hourly generation data is reshaped from wide to long format. Each row represents one hour of generation for a given plant and date.

### Daily Aggregation
Hourly values are summed to obtain daily energy generation.

### Monthly Aggregation
Daily energy values are aggregated at a monthly level by region and technology.

### Unit Conversion
All energy values are converted from MWh to GWh.

### Technology Classification
Technologies are classified into renewable and conventional categories following official definitions.

## Consumption Data

### Temporal Resolution
Daily consumption data is aggregated into monthly values.

### Unit Conversion
All consumption values are converted to GWh.

## Data Quality Rules
- Negative values are flagged and excluded.
- Missing hours are treated as zero only if explicitly documented.
- Missing days are reported as missing data.

 #### Handling Missing Categorical Values

Records with missing or empty categorical attributes (region or technology) were retained.
Missing values were explicitly labeled as 'Unknown' in the analytics layer to preserve total energy generation.

## Traceability
All transformed tables maintain a clear lineage to the original raw datasets.
