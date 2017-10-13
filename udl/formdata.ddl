DROP TABLE IF EXISTS formdata;

CREATE EXTERNAL TABLE IF NOT EXISTS formdata(
  `checked` TINYINT
, `client_time` BIGINT
, `created` DECIMAL(14, 4)
, `email` TINYINT
, `execution_time` INT
, `fieldvisibility` STRING
, `http_Content-Length` INT
, `http_User-Agent` STRING
, `http_X-Forwarded-For` STRING
, `id` STRING
, `init` STRING
, `label` STRING
, `labelvisibility` STRING
, `name` STRING
, `option_count` SMALLINT
, `option_label` STRING
, `page_id` CHAR(36)
, `phone` TINYINT
, `sequence_number` SMALLINT
, `token` CHAR(36)
, `type` SMALLINT
, `value` STRING
)
PARTITIONED BY (create_day DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/formdata/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

MSCK REPAIR TABLE formdata;
