CREATE EXTERNAL TABLE IF NOT EXISTS `deviceid`(
  `created` double, 
  `http_user_agent` string, 
  `http_x_forwarded_for` string, 
  `methods` smallint, 
  `token` varchar(36), 
  `uuid` varchar(32),
  `insert_ts` timestamp, 
  `insert_batch_run_id` int, 
  `insert_job_run_id` int, 
  `source_ts` timestamp)
PARTITIONED BY ( `create_day` date)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/deviceid/'
TBLPROPERTIES ("parquet.compress"="SNAPPY");
