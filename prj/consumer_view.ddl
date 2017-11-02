DROP TABLE IF EXISTS consumer_view;

CREATE EXTERNAL TABLE consumer_view (
  consumer_view_key      char(36),
  node_type_cd           char(10),
  value                  char(36),
  cluster_id             bigint,
  creation_ts            timestamp,
  generator_account_id   char(36),
  generator_campaign_key char(36),
  inserted_ts            timestamp
  ) PARTITIONED BY (partition_id smallint)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-prj/cis/consumer_view'
tblproperties ("parquet.compress"="SNAPPY");
