DROP TABLE IF EXISTS leads;

CREATE EXTERNAL TABLE IF NOT EXISTS leads(item MAP<STRING, STRING>)
PARTITIONED BY (created DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-rdl/leads/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

MSCK REPAIR TABLE leads;

