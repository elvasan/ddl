DROP TABLE IF EXISTS lead_dom;

CREATE EXTERNAL TABLE IF NOT EXISTS lead_dom(
  `client_time` STRING
, `dst` STRING
, `execution_time` STRING
, `flash_version` STRING
, `http_Content-Length` STRING
, `http_User-Agent` STRING
, `http_X-Forwarded-For` STRING
, `localStorage` STRING
, `navigator\\appCodeName` STRING
, `navigator\\language` STRING
, `navigator\\platform` STRING
, `navigator\\productSub` STRING
, `navigator\\userAgent` STRING
, `page_id` STRING
, `screen\\height` STRING
, `screen\\width` STRING
, `sequence_number` STRING
, `sessionStorage` STRING
, `token` STRING
, `tz` STRING
, `WebSocket` STRING
)
PARTITIONED BY (created DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/lead_dom/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

MSCK REPAIR TABLE lead_dom;
