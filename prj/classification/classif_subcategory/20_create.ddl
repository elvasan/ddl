CREATE EXTERNAL TABLE IF NOT EXISTS classif_subcategory (
  classif_subcategory_key int,
  classif_category_key    int,
  subcategory_nm          varchar(30),
  inserted_ts             timestamp
) STORED AS PARQUET
LOCATION '${LOCATION}';
