CREATE EXTERNAL TABLE IF NOT EXISTS edge (
  edge_key                 varchar(36),
  from_node_key            varchar(36),
  to_node_key              varchar(36),
  linkage_ts               timestamp,
  contributor_account_id   varchar(36),
  contributor_campaign_key varchar(36),
  call_center_ind          tinyint,
  user_agent_txt           varchar(1000),
  ip_address               varchar(50),
  bot_ind                  tinyint,
  inserted_ts              timestamp
) PARTITIONED BY (linkage_dt date)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-prj/cis/consumer_graph/edge';
