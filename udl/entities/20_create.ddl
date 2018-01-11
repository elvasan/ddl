CREATE EXTERNAL TABLE IF NOT EXISTS entities (
  `active` TINYINT
, `code` VARCHAR(36)
, `created` DOUBLE
, `industry` SMALLINT
, `modified` DOUBLE
, `name` VARCHAR(255)
, `insert_ts` TIMESTAMP
, `insert_job_run_id` VARCHAR(255)
, `source_ts` TIMESTAMP
)
STORED AS PARQUET
LOCATION '${LOCATION}'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');
