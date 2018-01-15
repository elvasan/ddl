CREATE EXTERNAL TABLE IF NOT EXISTS company (
  account_id        varchar(36), 
  company_nm        varchar(80), 
  entity_id         varchar(36), 
  is_active_ind     smallint, 
  role_nm           varchar(50), 
  insert_ts         timestamp, 
  insert_job_run_id varchar(255),
  source_ts         timestamp 
) 
STORED AS PARQUET
LOCATION '${LOCATION}'
TBLPROPERTIES ("parquet.compress"="SNAPPY")
