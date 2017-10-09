DROP TABLE IF EXISTS leads;

CREATE EXTERNAL TABLE IF NOT EXISTS leads(
  `account_code` STRING
, `Browser` STRING
, `Browser_Maker` STRING
, `browser_name` STRING
, `browser_name_pattern` STRING
, `browser_name_regex` STRING
, `campaign_key` STRING
, `client_time` STRING
, `Comment` STRING
, `created` STRING
, `Device_Pointing_Method` STRING
, `Device_Type` STRING
, `geoip_city` STRING
, `geoip_continent_code` STRING
, `geoip_country_code` STRING
, `geoip_isp` STRING
, `geoip_postal_code` STRING
, `geoip_region` STRING
, `http_Content-Length` STRING
, `http_User-Agent` STRING
, `http_X-Forwarded-For` STRING
, `ip` STRING
, `isMobileDevice` STRING
, `MajorVer` STRING
, `MinorVer` STRING
, `page_id` STRING
, `Parent` STRING
, `Platform` STRING
, `sequence_number` STRING
, `token` STRING
, `Version` STRING
)
PARTITIONED BY (created DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/leads/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

MSCK REPAIR TABLE leads;
