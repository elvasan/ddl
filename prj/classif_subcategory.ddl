DROP TABLE IF EXISTS classif_subcategory;

CREATE EXTERNAL TABLE classif_subcategory (
  classif_subcategory_key int,
  classif_category_key    int,
  subcategory_nm          varchar(30),
  inserted_ts             timestamp
) STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-prj/classification/classif_subcategory'
tblproperties ("parquet.compress"="SNAPPY");
