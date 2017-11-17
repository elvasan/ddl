CREATE EXTERNAL TABLE IF NOT EXISTS company (
  account_key         varchar(36), 
  account_id          varchar(36), 
  source_mod_ts       timestamp, 
  company_nm          varchar(80), 
  entity_id           varchar(36), 
  is_active_ind       smallint, 
  role_nm             varchar(50), 
  insert_ts           timestamp, 
  insert_batch_run_id int, 
  insert_job_run_id   int, 
  source_ts           timestamp,
  load_action_cd      string
) 
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-lrf/company/'
TBLPROPERTIES ("parquet.compress"="SNAPPY");
