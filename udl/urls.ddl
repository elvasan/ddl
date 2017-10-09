DROP TABLE IF EXISTS urls;

CREATE EXTERNAL TABLE IF NOT EXISTS urls(
  `campaign_key` STRING
, `client_time` STRING
, `hash` STRING
, `http_Content-Length` STRING
, `http_User-Agent` STRING
, `http_X-Forwarded-For` STRING
, `iframe` STRING
, `page_id` STRING
, `ref_hash` STRING
, `ref_url` STRING
, `sequence_number` STRING
, `token` STRING
, `url` STRING
)
PARTITIONED BY (created DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/urls/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

MSCK REPAIR TABLE urls;
