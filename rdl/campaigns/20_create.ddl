CREATE EXTERNAL TABLE IF NOT EXISTS campaigns(item MAP<STRING, STRING>)
STORED AS PARQUET
LOCATION 's3://jornaya-${ENV}-us-east-1-rdl/campaigns/';
