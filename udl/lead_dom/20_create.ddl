CREATE EXTERNAL TABLE IF NOT EXISTS `lead_dom` (
  `client_time` BIGINT
, `created` DOUBLE
, `dst` BOOLEAN
, `execution_time` INT
, `flash_version` STRING
, `http_content_length` INT
, `http_user_agent` STRING
, `http_x_forwarded_for` STRING
, `local_storage` BOOLEAN
, `navigator_app_code_name` STRING
, `navigator_language` STRING
, `navigator_platform` STRING
, `navigator_product_sub` STRING
, `navigator_user_agent` STRING
, `page_id` VARCHAR(36)
, `screen_height` SMALLINT
, `screen_width` SMALLINT
, `sequence_number` SMALLINT
, `session_storage` BOOLEAN
, `token` VARCHAR(36)
, `tz` SMALLINT
, `insert_ts` TIMESTAMP
, `source_ts` TIMESTAMP
)
PARTITIONED BY (`create_day` DATE, `insert_job_run_id` VARCHAR(255))
STORED AS PARQUET
LOCATION 's3://jornaya-${ENV}-us-east-1-udl/lead_dom/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');
