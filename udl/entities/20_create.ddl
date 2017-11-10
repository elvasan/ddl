CREATE EXTERNAL TABLE IF NOT EXISTS entities(
  `active` TINYINT
, `code` VARCHAR(36)
, `created` DOUBLE
, `industry` SMALLINT
, `modified` DOUBLE
, `name` VARCHAR(255)
, `insert_ts` TIMESTAMP
, `insert_batch_run_id` INT
, `insert_job_run_id` INT
, `source_ts` TIMESTAMP
)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/entities/'
TBLPROPERTIES ("parquet.compress"="SNAPPY");
