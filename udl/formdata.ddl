DROP TABLE IF EXISTS formdata;

CREATE EXTERNAL TABLE IF NOT EXISTS formdata(
  `checked` TINYINT
, `client_time` BIGINT
, `created` DECIMAL(14, 4)
, `email` TINYINT
, `execution_time` INT
, `fieldvisibility` STRING
, `http_content_length` INT
, `http_user_agent` STRING
, `http_x_forwarded_for` STRING
, `id` STRING
, `init` STRING
, `label` STRING
, `labelvisibility` STRING
, `name` STRING
, `optionCount` SMALLINT
, `optionLabel` STRING
, `page_id` CHAR(36)
, `phone` TINYINT
, `sequence_number` SMALLINT
, `token` CHAR(36)
, `type` SMALLINT
, `value` STRING
)
PARTITIONED BY (create_day DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/formdata/';

MSCK REPAIR TABLE formdata;
