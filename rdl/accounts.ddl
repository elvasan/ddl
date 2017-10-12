DROP TABLE IF EXISTS accounts;

CREATE EXTERNAL TABLE IF NOT EXISTS accounts(item MAP<STRING, STRING>)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-rdl/accounts/';
