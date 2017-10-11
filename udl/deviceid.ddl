DROP TABLE IF EXISTS deviceid;

CREATE EXTERNAL TABLE IF NOT EXISTS deviceid(
  `created` DECIMAL(14, 4)
, `http_User-Agent` STRING
, `http_X-Forwarded-For` STRING
, `methods` SMALLINT
, `token` CHAR(36)
, `uuid` CHAR(32)
)
PARTITIONED BY (create_day DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/deviceid/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

MSCK REPAIR TABLE deviceid;
