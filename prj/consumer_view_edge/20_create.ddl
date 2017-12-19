CREATE EXTERNAL TABLE IF NOT EXISTS consumer_view_edge (
  from_node_value          varchar(36),
  from_node_type_cd        varchar(30),
  to_node_value            varchar(36),
  to_node_type_cd          varchar(30),
  linkage_ts               timestamp
)
PARTITIONED BY (linkage_dt date, linkage_hr smallint)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-prj/cis/consumer_graph/consumer_view_edge/'
TBLPROPERTIES ('parquet.compress'='SNAPPY');
