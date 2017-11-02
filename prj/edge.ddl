DROP TABLE IF EXISTS edge;

CREATE EXTERNAL TABLE edge (
  edge_key                 char(36),
  from_node_key            char(36),
  to_node_key              char(36),
  linkage_ts               timestamp,
  contributor_account_id   char(36),
  contributor_campaign_key char(36),
  call_center_ind          tinyint,
  user_agent_txt           varchar(1000),
  ip_address               varchar(50),
  bot_ind                  tinyint,
  inserted_ts              timestamp
) PARTITIONED BY (linkage_dt date)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-prj/cis/consumer_graph/edge'
tblproperties ("parquet.compress"="SNAPPY");
