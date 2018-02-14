CREATE EXTERNAL TABLE IF NOT EXISTS `urls`(
  `campaign_key` varchar(36), 
  `client_time` bigint, 
  `created` double, 
  `hash` varchar(32), 
  `http_content_length` int, 
  `http_user_agent` string, 
  `http_x_forwarded_for` string, 
  `iframe` tinyint, 
  `page_id` varchar(36), 
  `ref_hash` varchar(32), 
  `ref_url` string, 
  `sequence_number` smallint, 
  `token` varchar(36), 
  `url` string, 
  `insert_ts` timestamp, 
  `insert_batch_run_id` int, 
  `insert_job_run_id` int, 
  `source_ts` timestamp)
PARTITIONED BY (create_day DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/urls/'
TBLPROPERTIES ("parquet.compress"="SNAPPY");
