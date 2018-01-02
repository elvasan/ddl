CREATE EXTERNAL TABLE IF NOT EXISTS `accounts` (
  `active` TINYINT
, `affiliate_click_network` TINYINT
, `api_key` VARCHAR(36)
, `audit_auth` INT
, `audit_full` INT
, `audit_pre` INT
, `audit_self` INT
, `call_center` TINYINT
, `code` VARCHAR(36)
, `contribute` INT
, `create` TINYINT
, `created` DOUBLE
, `email` STRING
, `entity_code` VARCHAR(36)
, `industry` SMALLINT
, `lead_aggregator` TINYINT
, `lead_originator` TINYINT
, `legal_agreed` TINYINT
, `legal_agreed_date` INT
, `logging` INT
, `marketplace` TINYINT
, `mobile_network` TINYINT
, `modified` DOUBLE
, `name` VARCHAR(45)
, `referral_source` STRING
, `role` STRING
, `status` SMALLINT
, `testing` INT
, `website` STRING
, `insert_ts` TIMESTAMP
, `insert_job_run_id` VARCHAR(255)
, `source_ts` TIMESTAMP
)
STORED AS PARQUET
LOCATION 's3://jornaya-${ENV}-us-east-1-udl/accounts/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');
