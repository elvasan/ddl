CREATE EXTERNAL TABLE IF NOT EXISTS account_opt_in (
  application_key smallint, 
  account_id      varchar(36), 
  opt_in_ind      smallint 
) 
STORED AS PARQUET
LOCATION '${LOCATION}';
