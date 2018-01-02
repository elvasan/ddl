CREATE EXTERNAL TABLE IF NOT EXISTS classif_category (
  classif_category_key int,
  category_name        varchar(30),
  inserted_ts          timestamp
) STORED AS PARQUET
LOCATION 's3://jornaya-${ENV}-us-east-1-prj/classification/classif_category';
