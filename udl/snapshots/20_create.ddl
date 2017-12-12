CREATE EXTERNAL TABLE IF NOT EXISTS `snapshots` (
  `capture_time` BIGINT
, `client_time` BIGINT
, `content_hash` VARCHAR(32)
, `content_url` STRING
, `element_ids` STRING
, `http_content_length` INT
, `http_user_agent` STRING
, `http_x_forwarded_for` STRING
, `page_id` VARCHAR(36)
, `sequence_number` SMALLINT
, `server_time` DOUBLE
, `token` VARCHAR(36)
, `type` STRING
, `url` STRING
, `insert_ts` TIMESTAMP
, `source_ts` TIMESTAMP
)
PARTITIONED BY (`create_day` DATE, `insert_job_run_id` INT)
STORED AS PARQUET
LOCATION "s3://jornaya-dev-us-east-1-udl/snapshots/"
TBLPROPERTIES ("parquet.compress"="SNAPPY");
