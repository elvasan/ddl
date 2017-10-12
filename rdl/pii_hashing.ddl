DROP TABLE IF EXISTS pii_hashing;

CREATE EXTERNAL TABLE IF NOT EXISTS pii_hashing(item MAP<STRING, STRING>)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-rdl/pii_hashing/';
