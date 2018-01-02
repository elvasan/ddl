CREATE EXTERNAL TABLE IF NOT EXISTS pii_hashing(item MAP<STRING, STRING>)
STORED AS PARQUET
LOCATION 's3://jornaya-${ENV}-us-east-1-rdl/pii_hashing/';
