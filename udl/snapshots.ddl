DROP TABLE IF EXISTS snapshots;

CREATE EXTERNAL TABLE IF NOT EXISTS snapshots(
  `capture_time` BIGINT
, `client_time` BIGINT
, `content_hash` CHAR(32)
, `content_url` STRING
, `element_ids` STRING
, `http_Content-Length` INT
, `http_User-Agent` STRING
, `http_X-Forwarded-For` STRING
, `page_id` CHAR(36)
, `sequence_number` SMALLINT
, `server_time` DECIMAL(14, 4)
, `token` CHAR(36)
, `type` STRING
, `url` STRING
)
PARTITIONED BY (create_day DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/snapshots/';

MSCK REPAIR TABLE snapshots;
