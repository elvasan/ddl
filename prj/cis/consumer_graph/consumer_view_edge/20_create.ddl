CREATE EXTERNAL TABLE IF NOT EXISTS consumer_view_edge (
  from_node_value          varchar(36),
  from_node_type_cd        varchar(30),
  to_node_value            varchar(36),
  to_node_type_cd          varchar(30),
  linkage_ts               timestamp
)
STORED AS PARQUET
LOCATION '${LOCATION}'
TBLPROPERTIES ('parquet.compress'='SNAPPY');
