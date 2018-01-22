CREATE EXTERNAL TABLE IF NOT EXISTS `entities`(
, `code` STRUCT<s:STRING>
, `created` STRUCT<n:STRING>
, `name` STRUCT<s:STRING>
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION '${LOCATION}';
