CREATE EXTERNAL TABLE IF NOT EXISTS `formdata` (
  `checked` TINYINT
, `client_time` BIGINT
, `created` DOUBLE
, `email` TINYINT
, `execution_time` INT
, `fieldvisibility` STRING
, `field_seq_nbr` INT
, `http_content_length` INT
, `http_user_agent` STRING
, `http_x_forwarded_for` STRING
, `id` STRING
, `init` STRING
, `label` STRING
, `labelvisibility` STRING
, `name` STRING
, `optioncount` SMALLINT
, `optionlabel` STRING
, `page_id` VARCHAR(36)
, `phone` TINYINT
, `sequence_number` SMALLINT
, `token` VARCHAR(36)
, `type` SMALLINT
, `value` STRING
, `insert_ts` TIMESTAMP
, `source_ts` TIMESTAMP
)
PARTITIONED BY (`create_day` DATE, `insert_job_run_id` VARCHAR(255))
STORED AS PARQUET
LOCATION 's3://jornaya-${ENV}-us-east-1-udl/formdata/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');
