DROP TABLE IF EXISTS classif_lead;

CREATE EXTERNAL TABLE classif_lead (
  lead_id         char(36),
  classif_set_key int,
  classif_ts      timestamp,
  inserted_ts     timestamp
) PARTITIONED BY (classif_dt DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-prj/classification/classif_lead'
tblproperties ("parquet.compress"="SNAPPY");
