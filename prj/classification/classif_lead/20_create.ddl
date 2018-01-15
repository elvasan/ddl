CREATE EXTERNAL TABLE IF NOT EXISTS classif_lead (
  lead_id         varchar(36),
  classif_set_key int,
  classif_ts      timestamp,
  inserted_ts     timestamp
) PARTITIONED BY (classif_dt DATE)
STORED AS PARQUET
LOCATION '${LOCATION}';
