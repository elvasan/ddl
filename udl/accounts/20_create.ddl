CREATE EXTERNAL TABLE IF NOT EXISTS `accounts` (
  `active` TINYINT
, `code` VARCHAR(36)
, `created` DOUBLE
, `entity_code` VARCHAR(36)
, `name` VARCHAR(45)
, `role` STRING
, `insert_ts` TIMESTAMP
, `insert_job_run_id` VARCHAR(255)
, `source_ts` TIMESTAMP
)
STORED AS PARQUET
LOCATION '${LOCATION}'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');
