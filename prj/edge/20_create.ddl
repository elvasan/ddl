CREATE EXTERNAL TABLE IF NOT EXISTS edge (
  from_node_value          varchar(36),
  from_node_type_cd        varchar(30),
  to_node_value            varchar(36),
  to_node_type_cd          varchar(30),
  linkage_ts               timestamp,
  contributor_account_id   varchar(36),
  contributor_campaign_key varchar(36),
  call_center_ind          smallint,
  user_agent_txt           varchar(1000),
  ip_address               varchar(50),
  insert_ts                timestamp,
  insert_job_run_id        varchar(255),
  source_ts                timestamp
)
PARTITIONED BY (linkage_dt date, linkage_hr smallint)
STORED AS PARQUET
LOCATION 's3://jornaya-${ENV}-us-east-1-prj/cis/consumer_graph/edge/'
TBLPROPERTIES ('parquet.compress'='SNAPPY');
