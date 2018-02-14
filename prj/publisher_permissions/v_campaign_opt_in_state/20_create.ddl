CREATE EXTERNAL TABLE IF NOT EXISTS v_campaign_opt_in_state (
  application_key   smallint, 
  campaign_key      varchar(36), 
  opt_in_ind        smallint, 
  insert_job_run_id varchar(255), 
  insert_ts         timestamp
) 
STORED AS PARQUET
LOCATION '${LOCATION}'
TBLPROPERTIES ("parquet.compress"="SNAPPY");

