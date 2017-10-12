DROP TABLE IF EXISTS pii_hashing;

CREATE EXTERNAL TABLE IF NOT EXISTS pii_hashing(
  `canonical_hash` CHAR(32)
, `hash` STRING
, `hash_type` STRING
)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/pii_hashing/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');
