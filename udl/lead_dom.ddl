DROP TABLE IF EXISTS lead_dom;

CREATE EXTERNAL TABLE IF NOT EXISTS lead_dom(
  `client_time` BIGINT
, `created` DECIMAL(14, 4)
, `dst` BOOLEAN
, `execution_time` INT
, `flash_version` STRING
, `http_Content-Length` INT
, `http_User-Agent` STRING
, `http_X-Forwarded-For` STRING
, `localStorage` BOOLEAN
, `navigator\\appCodeName` STRING
, `navigator\\language` STRING
, `navigator\\platform` STRING
, `navigator\\productSub` STRING
, `navigator\\userAgent` STRING
, `page_id` CHAR(36)
, `screen\\height` SMALLINT
, `screen\\width` SMALLINT
, `sequence_number` SMALLINT
, `sessionStorage` BOOLEAN
, `token` CHAR(36)
, `tz` SMALLINT
, `WebSocket` BOOLEAN
)
PARTITIONED BY (create_day DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/lead_dom/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

MSCK REPAIR TABLE lead_dom;
