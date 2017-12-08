CREATE EXTERNAL TABLE IF NOT EXISTS `formdata`(
  `checked` tinyint, 
  `client_time` bigint, 
  `created` double, 
  `email` tinyint, 
  `execution_time` int, 
  `fieldvisibility` string, 
  `field_seq_nbr` int, 
  `http_content_length` int, 
  `http_user_agent` string, 
  `http_x_forwarded_for` string, 
  `id` string, 
  `init` string, 
  `label` string, 
  `labelvisibility` string, 
  `name` string, 
  `optioncount` smallint, 
  `optionlabel` string, 
  `page_id` varchar(36), 
  `phone` tinyint, 
  `sequence_number` smallint, 
  `token` varchar(36), 
  `type` smallint, 
  `value` string, 
  `insert_ts` timestamp, 
  `insert_batch_run_id` int, 
  `insert_job_run_id` int, 
  `source_ts` timestamp)
PARTITIONED BY (create_day DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/formdata/'
TBLPROPERTIES ("parquet.compress"="SNAPPY");
