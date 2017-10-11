DROP TABLE IF EXISTS urls;

CREATE EXTERNAL TABLE IF NOT EXISTS urls(
  `campaign_key` CHAR(36)
, `client_time` BIGINT
, `created` DECIMAL(14, 4)
, `hash` CHAR(32)
, `http_Content-Length` INT
, `http_User-Agent` STRING
, `http_X-Forwarded-For` STRING
, `iframe` TINYINT
, `page_id` VARCHAR(36)
, `ref_hash` CHAR(32)
, `ref_url` STRING
, `sequence_number` SMALLINT
, `token` CHAR(36)
, `url` STRING
)
PARTITIONED BY (create_day DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/urls/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

MSCK REPAIR TABLE urls;
