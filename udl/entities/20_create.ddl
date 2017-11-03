CREATE EXTERNAL TABLE IF NOT EXISTS entities(
  `active` TINYINT
, `code` VARCHAR(36)
, `created` BIGINT
, `industry` SMALLINT
, `modified` BIGINT
, `name` VARCHAR(255)
)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/entities/';
