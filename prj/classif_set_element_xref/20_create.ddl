CREATE EXTERNAL TABLE IF NOT EXISTS classif_set_element_xref (
  classif_set_key         int,
  classif_element_key     int,
  classif_subcategory_key int,
  classif_category_key    int,
  inserted_ts             timestamp
 ) STORED AS PARQUET
LOCATION 's3://jornaya-${ENV}-us-east-1-prj/classification/classif_set_element_xref';
