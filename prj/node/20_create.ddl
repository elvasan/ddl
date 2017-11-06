CREATE EXTERNAL TABLE IF NOT EXISTS node (
  node_key               varchar(36),
  node_type_cd           varchar(10),
  value                  varchar(36),
  creation_ts            timestamp,
  generator_account_id   varchar(36),
  generator_campaign_key varchar(36),
  call_center_ind        tinyint,
  user_agent_txt         varchar(1000),
  ip_address             varchar(50),
  bot_ind                tinyint,
  inserted_ts            timestamp
) PARTITIONED BY (creation_dt date)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-prj/cis/consumer_graph/node';