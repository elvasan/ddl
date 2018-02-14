CREATE EXTERNAL TABLE IF NOT EXISTS abc_logs(
  job_nm varchar(50),
  job_run_id varchar(255),
  job_run_status_cd varchar(30),
  event_cd varchar(30),
  event_ts timestamp
)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION '${LOCATION}'
