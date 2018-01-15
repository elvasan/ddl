CREATE EXTERNAL TABLE IF NOT EXISTS snapshots(item MAP<STRING, STRING>)
PARTITIONED BY (created DATE)
STORED AS PARQUET
LOCATION '${LOCATION}';
