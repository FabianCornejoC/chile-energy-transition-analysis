SELECT *
FROM generation_monthly_analytics;

SELECT *
FROM generation_HOURLY_raw;

SELECT MAX(year_month), MIN(year_month)
FROM generation_monthly_analytics;

SELECT
	EXTRACT(YEAR FROM year_month) AS year,
	COUNT(*) AS rows
FROM generation_monthly_analytics
GROUP BY year
ORDER BY year;

SELECT
	SUM(energy_mwh)
FROM generation_monthly_analytics;

SELECT
	SUM(
	COALESCE(hora_01, 0) +
	COALESCE(hora_02, 0) +
	COALESCE(hora_03, 0) +
	COALESCE(hora_04, 0) +
	COALESCE(hora_05, 0) +
	COALESCE(hora_06, 0) +
	COALESCE(hora_07, 0) +
	COALESCE(hora_08, 0) +
	COALESCE(hora_09, 0) +
	COALESCE(hora_10, 0) +
	COALESCE(hora_11, 0) +
	COALESCE(hora_12, 0) +
	COALESCE(hora_13, 0) +
	COALESCE(hora_14, 0) +
	COALESCE(hora_15, 0) +
	COALESCE(hora_16, 0) +
	COALESCE(hora_17, 0) +
	COALESCE(hora_18, 0) +
	COALESCE(hora_19, 0) +
	COALESCE(hora_20, 0) +
	COALESCE(hora_21, 0) +
	COALESCE(hora_22, 0) +
	COALESCE(hora_23, 0) +
	COALESCE(hora_24, 0) +
	COALESCE(hora_25, 0) 
	) AS total_energy_raw
FROM generation_hourly_raw;

SELECT 
	SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) as nulls_1,
	SUM(CASE WHEN technology_type IS NULL THEN 1 ELSE 0 END) as nulls_2,
	SUM(CASE WHEN energy_mwh IS NULL THEN 1 ELSE 0 END) as nulls_3
FROM generation_monthly_analytics;

SELECT region, COUNT(*) 
FROM generation_monthly_analytics
WHERE region = 'Unknown'
GROUP BY region;

SELECT COUNT(*) 
FROM generation_monthly_analytics
WHERE energy_generated IS NULL;
