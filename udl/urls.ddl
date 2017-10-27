DROP TABLE IF EXISTS urls;

CREATE EXTERNAL TABLE IF NOT EXISTS urls(
  `campaign_key` VARCHAR(36)
, `client_time` BIGINT
, `created` BIGINT
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
)
PARTITIONED BY (create_day DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/urls/';

MSCK REPAIR TABLE urls;
