DROP TABLE IF EXISTS campaigns;

CREATE EXTERNAL TABLE IF NOT EXISTS campaigns(
  `account_code` CHAR(36)
, `audience_id_tags` STRING
, `campaign_javascript_version` STRING
, `created` DECIMAL(14, 4)
, `created_by` SMALLINT
, `description` STRING
, `forensiq_default` TINYINT
, `hash_urls` TINYINT
, `key` CHAR(36)
, `log_level` SMALLINT
, `log_limit` SMALLINT
, `log_targets` SMALLINT
, `modified` DECIMAL(14, 4)
, `modified_by` SMALLINT
, `name` STRING
, `threatmetrix_default` TINYINT
)
LOCATION 's3://jornaya-dev-us-east-1-udl/campaigns/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

