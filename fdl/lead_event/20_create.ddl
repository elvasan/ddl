CREATE EXTERNAL TABLE IF NOT EXISTS lead_event (
  lead_id               varchar(36),
  server_gmt_ts         timestamp,
  server_gmt_date_key   bigint,
  server_gmt_time_key   bigint,
  client_local_ts       timestamp,
  client_local_date_key bigint,
  client_local_time_key bigint,
  generator_account_key varchar(36),
  account_id            varchar(36),
  ip_geolocation_key    varchar(36),
  user_agent_key        varchar(36),
  campaign_snapshot_key bigint,
  campaign_key          varchar(36),
  ip_address            varchar(50),
  message_size_bytes    int,
  x_forwarded_for_txt   varchar(255),
  user_agent_txt        varchar(255),
  insert_ts             timestamp,
  source_ts             timestamp
  )
PARTITIONED BY (server_gmt_dt date, insert_job_run_id string)
STORED AS PARQUET
LOCATION 's3://jornaya-${ENV}-us-east-1-fdl/lead_event/'
TBLPROPERTIES ("parquet.compress"="SNAPPY");
