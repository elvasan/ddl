CREATE EXTERNAL TABLE IF NOT EXISTS snapshots(item MAP<STRING, STRING>)
PARTITIONED BY (created DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-${ENV}-us-east-1-rdl/snapshots/snapshots_0917/';
