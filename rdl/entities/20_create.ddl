CREATE EXTERNAL TABLE IF NOT EXISTS `entities`(
  `account_code` STRUCT<s:STRING>
, `active` STRUCT<n:STRING>
, `code` STRUCT<s:STRING>
, `created` STRUCT<n:STRING>
, `industry` STRUCT<n:STRING>
, `modified` STRUCT<n:STRING>
, `name` STRUCT<s:STRING>
, `role` STRUCT<n:STRING>
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://jornaya-${ENV}-us-east-1-rdl/entities/';
