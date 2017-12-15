CREATE EXTERNAL TABLE IF NOT EXISTS `deviceid` (
  `created` DOUBLE
, `http_user_agent` STRING
, `http_x_forwarded_for` STRING
, `methods` SMALLINT
, `token` VARCHAR(36)
, `uuid` VARCHAR(32)
, `insert_ts` TIMESTAMP
, `source_ts` TIMESTAMP
)
PARTITIONED BY (`create_day` DATE, `insert_job_run_id` VARCHAR(255))
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/deviceid/'
TBLPROPERTIES ('parquet.compress'='SNAPPY');
