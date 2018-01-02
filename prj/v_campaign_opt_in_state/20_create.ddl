CREATE EXTERNAL TABLE IF NOT EXISTS v_campaign_opt_in_state (
  application_key   smallint, 
  campaign_key      varchar(36), 
  opt_in_ind        smallint, 
  insert_job_run_id varchar(255), 
  insert_ts         timestamp
) 
STORED AS PARQUET
LOCATION 's3://jornaya-${ENV}-us-east-1-prj/publisher_permissions/v_campaign_opt_in_state/'
TBLPROPERTIES ("parquet.compress"="SNAPPY");

