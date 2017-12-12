CREATE EXTERNAL TABLE IF NOT EXISTS `leads` (
  `account_code` VARCHAR(36)
, `browser` STRING
, `browser_maker` STRING
, `browser_name` STRING
, `campaign_key` VARCHAR(36)
, `client_time` BIGINT
, `created` DOUBLE
, `device_pointing_method` STRING
, `device_type` STRING
, `geoip_city` STRING
, `geoip_continent_code` STRING
, `geoip_country_code` STRING
, `geoip_isp` STRING
, `geoip_postal_code` STRING
, `geoip_region` STRING
, `http_content_length` INT
, `http_user_agent` STRING
, `http_x_forwarded_for` STRING
, `ip` BIGINT
, `is_mobile_device` tinyint
, `major_ver` STRING
, `minor_ver` STRING
, `page_id` VARCHAR(36)
, `parent` STRING
, `platform` STRING
, `sequence_number` INT
, `token` VARCHAR(36)
, `version` STRING
, `insert_ts` TIMESTAMP
, `source_ts` TIMESTAMP
)
PARTITIONED BY (`create_day` DATE, `insert_job_run_id` INT)
STORED AS PARQUET
LOCATION 's3://jornaya-dev-us-east-1-udl/leads/'
TBLPROPERTIES ("parquet.compress"="SNAPPY");
