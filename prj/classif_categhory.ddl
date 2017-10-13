CREATE EXTERNAL TABLE classif_category (
  classif_category_key int, 
  category_name        varchar(30), 
  inserted_ts          timestamp 
) STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-prj/classification/classif_category'
tblproperties ("parquet.compress"="SNAPPY");
