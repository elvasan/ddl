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
  load_action_cd      string
)
STORED AS PARQUET
LOCATION '${LOCATION}'
TBLPROPERTIES ("parquet.compress"="SNAPPY");
