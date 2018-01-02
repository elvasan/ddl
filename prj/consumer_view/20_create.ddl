CREATE EXTERNAL TABLE IF NOT EXISTS consumer_view (
  consumer_view_key      varchar(36),
  node_type_cd           varchar(10),
  value                  varchar(36),
  cluster_id             bigint,
  creation_ts            timestamp,
  generator_account_id   varchar(36),
  generator_campaign_key varchar(36),
  inserted_ts            timestamp
  ) PARTITIONED BY (partition_id smallint)
STORED AS PARQUET
LOCATION 's3://jornaya-${ENV}-us-east-1-prj/cis/consumer_graph/consumer_view';
