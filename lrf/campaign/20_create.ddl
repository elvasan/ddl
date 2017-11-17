CREATE EXTERNAL TABLE IF NOT EXISTS campaign (
  campaign_key        varchar(36),
  campaign_nm         varchar(50),
  campaign_desc       varchar(255),
  industry_nm         varchar(50),
  account_id          varchar(36),
  insert_ts           timestamp,
  insert_batch_run_id int,
  insert_job_run_id   int,
  source_ts           timestamp,
  load_action_code    string
)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-lrf/campaign/'
TBLPROPERTIES ("parquet.compress"="SNAPPY");
