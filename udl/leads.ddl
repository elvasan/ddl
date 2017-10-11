DROP TABLE IF EXISTS leads;

CREATE EXTERNAL TABLE IF NOT EXISTS leads(
  `account_code` CHAR(36)
, `Browser` STRING
, `Browser_Maker` STRING
, `browser_name` STRING
, `browser_name_pattern` STRING
, `browser_name_regex` STRING
, `campaign_key` CHAR(36)
, `client_time` BIGINT
, `Comment` STRING
, `created` DECIMAL(14, 4)
, `Device_Pointing_Method` STRING
, `Device_Type` STRING
, `geoip_city` STRING
, `geoip_continent_code` STRING
, `geoip_country_code` STRING
, `geoip_isp` STRING
, `geoip_postal_code` STRING
, `geoip_region` STRING
, `http_Content-Length` INT
, `http_User-Agent` STRING
, `http_X-Forwarded-For` STRING
, `ip` BIGINT
, `isMobileDevice` STRING
, `MajorVer` STRING
, `MinorVer` STRING
, `page_id` CHAR(36)
, `Parent` STRING
, `Platform` STRING
, `sequence_number` INT
, `token` CHAR(36)
, `Version` STRING
)
PARTITIONED BY (create_day DATE)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/leads/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

MSCK REPAIR TABLE leads;
