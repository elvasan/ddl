CREATE EXTERNAL TABLE IF NOT EXISTS account_opt_in (
  application_key smallint, 
  account_id      varchar(36), 
  opt_in_ind      smallint 
) 
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-prj/publisher_permissions/setup/account_opt_in/';
