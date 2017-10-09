DROP TABLE IF EXISTS formdata;

CREATE EXTERNAL TABLE IF NOT EXISTS formdata(
  `checked` STRING
, `client_time` STRING
, `email` STRING
, `execution_time` STRING
, `fieldvisibility` STRING
, `http_content_length` STRING
, `http_user_agent` STRING
, `http_x_forwarded_for` STRING
, `id` STRING
, `init` STRING
, `label` STRING
, `labelvisibility` STRING
, `name` STRING
, `option_count` STRING
, `option_label` STRING
, `page_id` STRING
, `phone` STRING
, `sequence_number` STRING
, `token` STRING
, `type` STRING
, `value` STRING
)
PARTITIONED BY (created DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/formdata/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

MSCK REPAIR TABLE formdata;
