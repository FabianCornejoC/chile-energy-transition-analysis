CREATE TABLE generation_hourly_staging (
Nombre_Central TEXT,
Llave_Nombre TEXT,
TIPO TEXT,
SUBTIPO TEXT,
REGION TEXT,
ENRC_CONV TEXT,
FACTOR_ENRC TEXT,
FECHA TEXT,
HORA_01 TEXT,
HORA_02 TEXT,
HORA_03 TEXT,
HORA_04 TEXT,
HORA_05 TEXT,
HORA_06 TEXT,
HORA_07 TEXT,
HORA_08 TEXT,
HORA_09 TEXT,
HORA_10 TEXT,
HORA_11 TEXT,
HORA_12 TEXT,
HORA_13 TEXT,
HORA_14 TEXT,
HORA_15 TEXT,
HORA_16 TEXT,
HORA_17 TEXT,
HORA_18 TEXT,
HORA_19 TEXT,
HORA_20 TEXT,
HORA_21 TEXT,
HORA_22 TEXT,
HORA_23 TEXT,
HORA_24 TEXT,
HORA_25 TEXT,
Total TEXT
);

CREATE TABLE generation_hourly_raw (
Nombre_Central TEXT,
Llave_Nombre TEXT,
TIPO TEXT,
SUBTIPO TEXT,
REGION TEXT,
ENRC_CONV TEXT,
FACTOR_ENRC NUMERIC,
FECHA DATE,
HORA_01 NUMERIC,
HORA_02 NUMERIC,
HORA_03 NUMERIC,
HORA_04 NUMERIC,
HORA_05 NUMERIC,
HORA_06 NUMERIC,
HORA_07 NUMERIC,
HORA_08 NUMERIC,
HORA_09 NUMERIC,
HORA_10 NUMERIC,
HORA_11 NUMERIC,
HORA_12 NUMERIC,
HORA_13 NUMERIC,
HORA_14 NUMERIC,
HORA_15 NUMERIC,
HORA_16 NUMERIC,
HORA_17 NUMERIC,
HORA_18 NUMERIC,
HORA_19 NUMERIC,
HORA_20 NUMERIC,
HORA_21 NUMERIC,
HORA_22 NUMERIC,
HORA_23 NUMERIC,
HORA_24 NUMERIC,
HORA_25 NUMERIC,
Total NUMERIC
);

INSERT INTO generation_hourly_raw
SELECT
	nombre_central,
	llave_nombre,
	tipo,
	subtipo,
	region,
	enrc_conv,
	REPLACE(factor_enrc, ',', '')::NUMERIC,
	TO_DATE(fecha, 'DD-MM-YYYY'),
	REPLACE(hora_01, ',', '')::NUMERIC,
	REPLACE(hora_02, ',', '')::NUMERIC,
	REPLACE(hora_03, ',', '')::NUMERIC,
	REPLACE(hora_04, ',', '')::NUMERIC,
	REPLACE(hora_05, ',', '')::NUMERIC,
	REPLACE(hora_06, ',', '')::NUMERIC,
	REPLACE(hora_07, ',', '')::NUMERIC,
	REPLACE(hora_08, ',', '')::NUMERIC,
	REPLACE(hora_09, ',', '')::NUMERIC,
	REPLACE(hora_10, ',', '')::NUMERIC,
	REPLACE(hora_11, ',', '')::NUMERIC,
	REPLACE(hora_12, ',', '')::NUMERIC,
	REPLACE(hora_13, ',', '')::NUMERIC,
	REPLACE(hora_14, ',', '')::NUMERIC,
	REPLACE(hora_15, ',', '')::NUMERIC,
	REPLACE(hora_16, ',', '')::NUMERIC,
	REPLACE(hora_17, ',', '')::NUMERIC,
	REPLACE(hora_18, ',', '')::NUMERIC,
	REPLACE(hora_19, ',', '')::NUMERIC,
	REPLACE(hora_20, ',', '')::NUMERIC,
	REPLACE(hora_21, ',', '')::NUMERIC,
	REPLACE(hora_22, ',', '')::NUMERIC,
	REPLACE(hora_23, ',', '')::NUMERIC,
	REPLACE(hora_24, ',', '')::NUMERIC,
	REPLACE(hora_25, ',', '')::NUMERIC,
	REPLACE(total, ',', '')::NUMERIC
FROM generation_hourly_staging;

SELECT COUNT(*)
FROM generation_hourly_raw;

CREATE TABLE generation_monthly_analytics AS
SELECT
	region,
	tipo AS technology_type,
	enrc_conv AS energy_type,
	DATE_TRUNC('month', fecha)::DATE AS year_month,
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
	) AS energy_mwh
FROM generation_hourly_raw
GROUP BY
	region,
	tipo,
	enrc_conv,
	DATE_TRUNC('month', fecha);


