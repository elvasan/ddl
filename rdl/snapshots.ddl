DROP TABLE IF EXISTS snapshots;

CREATE EXTERNAL TABLE IF NOT EXISTS snapshots(item MAP<STRING, STRING>)
PARTITIONED BY (created DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-rdl/snapshots/snapshots_0917/';

MSCK REPAIR TABLE snapshots;
