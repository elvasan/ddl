DROP TABLE IF EXISTS campaigns;

CREATE EXTERNAL TABLE IF NOT EXISTS campaigns(
  `account_code` STRING
, `audience_id_tags` STRING
, `campaign_javascript_version` STRING
, `created` STRING
, `created_by` STRING
, `description` STRING
, `forensiq_default` STRING
, `hash_urls` STRING
, `key` STRING
, `log_level` STRING
, `log_limit` STRING
, `log_targets` STRING
, `modified` STRING
, `modified_by` STRING
, `name` STRING
, `threatmetrix_default` STRING
)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/campaigns/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

