CREATE EXTERNAL TABLE IF NOT EXISTS classif_element (
  classif_element_key     int,
  classif_subcategory_key int,
  element_nm              varchar(30),
  inserted_ts             timestamp
) STORED AS PARQUET
LOCATION '${LOCATION}';
