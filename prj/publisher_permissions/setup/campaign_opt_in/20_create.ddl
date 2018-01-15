CREATE EXTERNAL TABLE IF NOT EXISTS campaign_opt_in (
  application_key smallint, 
  campaign_key    varchar(36), 
  opt_in_ind      smallint 
) 
STORED AS PARQUET
LOCATION '${LOCATION}';
