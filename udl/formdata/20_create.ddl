CREATE EXTERNAL TABLE IF NOT EXISTS formdata(
  `checked` TINYINT
, `client_time` BIGINT
, `created` DOUBLE
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
, `optionCount` SMALLINT
, `optionLabel` STRING
, `page_id` VARCHAR(36)
, `phone` TINYINT
, `sequence_number` SMALLINT
, `token` VARCHAR(36)
, `type` SMALLINT
, `value` STRING
)
PARTITIONED BY (create_day DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/formdata/'
TBLPROPERTIES ("parquet.compress"="SNAPPY");
