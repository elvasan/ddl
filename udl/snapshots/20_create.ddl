CREATE EXTERNAL TABLE IF NOT EXISTS `snapshots`(
  `capture_time` bigint, 
  `client_time` bigint, 
  `content_hash` varchar(32), 
  `content_url` string, 
  `element_ids` string, 
  `http_content_length` int, 
  `http_user_agent` string, 
  `http_x_forwarded_for` string, 
  `page_id` varchar(36), 
  `sequence_number` smallint, 
  `server_time` double, 
  `token` varchar(36), 
  `type` string, 
  `url` string, 
  `insert_ts` timestamp, 
  `insert_batch_run_id` int, 
  `insert_job_run_id` int, 
  `source_ts` timestamp)
PARTITIONED BY (create_day DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/snapshots/'
TBLPROPERTIES ("parquet.compress"="SNAPPY");
