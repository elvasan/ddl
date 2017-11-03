CREATE EXTERNAL TABLE IF NOT EXISTS entities(item MAP<STRING, STRING>)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-rdl/entities/';
