CREATE EXTERNAL TABLE IF NOT EXISTS `campaigns`(
  `account_code` varchar(36), 
  `audience_id_tags` string, 
  `campaign_javascript_version` string, 
  `created` double, 
  `created_by` smallint, 
  `description` string, 
  `forensiq_default` tinyint, 
  `hash_urls` tinyint, 
  `key` varchar(36), 
  `log_level` smallint, 
  `log_limit` smallint, 
  `log_targets` smallint, 
  `modified` double, 
  `modified_by` smallint, 
  `name` string, 
  `threatmetrix_default` tinyint, 
  `insert_ts` timestamp, 
  `insert_batch_run_id` int, 
  `insert_job_run_id` int, 
  `source_ts` timestamp)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/campaigns/'
TBLPROPERTIES ("parquet.compress"="SNAPPY");
