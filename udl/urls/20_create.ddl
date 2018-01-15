CREATE EXTERNAL TABLE IF NOT EXISTS `urls` (
  `campaign_key` VARCHAR(36)
, `client_time` BIGINT
, `created` DOUBLE
, `hash` VARCHAR(32)
, `http_content_length` INT
, `http_user_agent` STRING
, `http_x_forwarded_for` STRING
, `iframe` TINYINT
, `page_id` VARCHAR(36)
, `ref_hash` VARCHAR(32)
, `ref_url` STRING
, `sequence_number` SMALLINT
, `token` VARCHAR(36)
, `url` STRING
, `insert_ts` TIMESTAMP
, `source_ts` TIMESTAMP
)
PARTITIONED BY (`create_day` DATE, `insert_job_run_id` VARCHAR(255))
STORED AS PARQUET
LOCATION '${LOCATION}'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');
