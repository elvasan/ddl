CREATE EXTERNAL TABLE IF NOT EXISTS `accounts`(
  `active` STRUCT<n:STRING>
, `code` STRUCT<s:STRING>
, `created` STRUCT<n:STRING>
, `entity_code` STRUCT<s:STRING>
, `name` STRUCT<s:STRING>
, `role` STRUCT<s:STRING>
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION '${LOCATION}';
