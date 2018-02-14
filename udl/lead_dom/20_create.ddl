CREATE EXTERNAL TABLE IF NOT EXISTS `lead_dom`(
  `client_time` bigint, 
  `created` double, 
  `dst` boolean, 
  `execution_time` int, 
  `flash_version` string, 
  `http_content_length` int, 
  `http_user_agent` string, 
  `http_x_forwarded_for` string, 
  `local_storage` boolean, 
  `navigator_app_code_name` string, 
  `navigator_language` string, 
  `navigator_platform` string, 
  `navigator_product_sub` string, 
  `navigator_user_agent` string, 
  `page_id` varchar(36), 
  `screen_height` smallint, 
  `screen_width` smallint, 
  `sequence_number` smallint, 
  `session_storage` boolean, 
  `token` varchar(36), 
  `tz` smallint, 
  `insert_ts` timestamp, 
  `insert_batch_run_id` int, 
  `insert_job_run_id` int, 
  `source_ts` timestamp)
PARTITIONED BY (create_day DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/lead_dom/'
TBLPROPERTIES ("parquet.compress"="SNAPPY");
