CREATE EXTERNAL TABLE IF NOT EXISTS entities(
  `active` TINYINT
, `code` VARCHAR(36)
, `created` INT
, `industry` SMALLINT
, `modified` INT
, `name` VARCHAR(255)
)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/entities/'
TBLPROPERTIES ("parquet.compress"="SNAPPY");
