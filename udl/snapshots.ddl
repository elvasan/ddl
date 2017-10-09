DROP TABLE IF EXISTS snapshots;

CREATE EXTERNAL TABLE IF NOT EXISTS snapshots(
  `capture_time` STRING
, `client_time` STRING
, `content_hash` STRING
, `content_url` STRING
, `element_ids` STRING
, `http_Content-Length` STRING
, `http_User-Agent` STRING
, `http_X-Forwarded-For` STRING
, `page_id` STRING
, `sequence_number` STRING
, `server_time` STRING
, `token` STRING
, `type` STRING
, `url` STRING
)
PARTITIONED BY (created DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/snapshots/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

MSCK REPAIR TABLE snapshots;
