CREATE EXTERNAL TABLE IF NOT EXISTS classif_element (
  classif_element_key     int,
  classif_subcategory_key int,
  element_nm              varchar(30),
  inserted_ts             timestamp
) STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-prj/classification/classif_element';
