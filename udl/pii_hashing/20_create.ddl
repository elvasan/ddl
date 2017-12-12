CREATE EXTERNAL TABLE IF NOT EXISTS pii_hashing (
  `canonical_hash` VARCHAR(32)
, `hash` STRING
, `hash_type` STRING
, `insert_ts` TIMESTAMP
, `insert_job_run_id` INT
, `source_ts` TIMESTAMP
)
STORED AS PARQUET
LOCATION "s3://jornaya-dev-us-east-1-udl/pii_hashing/"
TBLPROPERTIES ("parquet.compress"="SNAPPY");
