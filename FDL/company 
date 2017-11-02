CREATE EXTERNAL TABLE IF NOT EXISTS `company`(
  `account_key` varchar(36), 
  `account_id` varchar(36), 
  `source_mod_ts` timestamp, 
  `company_nm` varchar(80), 
  `entity_id` varchar(36), 
  `is_active_ind` boolean, 
  `role_nm` varchar(50), 
  `insert_ts` timestamp, 
  `insert_batch_run_id` int, 
  `insert_job_run_id` int, 
  `source_ts` timestamp)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://jornaya-dev-us-east-1-fdl/company'