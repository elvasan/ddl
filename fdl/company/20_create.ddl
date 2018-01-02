CREATE EXTERNAL TABLE IF NOT EXISTS company (
  account_key       varchar(36), 
  account_id        varchar(36), 
  source_ts         timestamp, 
  company_nm        varchar(80), 
  entity_id         varchar(36), 
  is_active_ind     smallint, 
  role_nm           varchar(50), 
  insert_ts         timestamp, 
  insert_job_run_id varchar(255)
) 
STORED AS PARQUET
LOCATION 's3://jornaya-${ENV}-us-east-1-fdl/company/'
TBLPROPERTIES ("parquet.compress"="SNAPPY")
