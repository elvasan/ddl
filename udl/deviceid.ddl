DROP TABLE IF EXISTS deviceid;

CREATE EXTERNAL TABLE IF NOT EXISTS deviceid(
  `created` STRING
, `http_User-Agent` STRING
, `http_X-Forwarded-For` STRING
, `methods` STRING
, `token` STRING
, `uuid` STRING
)
PARTITIONED BY (created DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/deviceid/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

MSCK REPAIR TABLE deviceid;
