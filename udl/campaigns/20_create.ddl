CREATE EXTERNAL TABLE IF NOT EXISTS `campaigns` (
  `account_code` VARCHAR(36)
, `audience_id_tags` STRING
, `campaign_javascript_version` STRING
, `created` DOUBLE
, `created_by` SMALLINT
, `description` STRING
, `forensiq_default` TINYINT
, `hash_urls` TINYINT
, `key` VARCHAR(36)
, `log_level` SMALLINT
, `log_limit` SMALLINT
, `log_targets` SMALLINT
, `modified` DOUBLE
, `modified_by` SMALLINT
, `name` STRING
, `threatmetrix_default` TINYINT
, `insert_ts` TIMESTAMP
, `insert_job_run_id` VARCHAR(255)
, `source_ts` TIMESTAMP
)
STORED AS PARQUET
LOCATION "s3://jornaya-dev-us-east-1-udl/campaigns/"
TBLPROPERTIES ("parquet.compress"="SNAPPY");
