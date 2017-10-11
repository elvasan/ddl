DROP TABLE IF EXISTS accounts;

CREATE EXTERNAL TABLE IF NOT EXISTS accounts(
  `active` TINYINT
, `affiliate_click_network` TINYINT
, `api_key` CHAR(36)
, `audit_auth` TINYINT
, `audit_full` TINYINT
, `audit_pre` TINYINT
, `audit_self` TINYINT
, `call_center` TINYINT
, `code` CHAR(36)
, `contribute` TINYINT
, `create` TINYINT
, `created` DECIMAL(14, 4)
, `email` STRING
, `entity_code` CHAR(36)
, `industry` SMALLINT
, `lead_aggregator` TINYINT
, `lead_originator` TINYINT
, `legal_agreed` TINYINT
, `legal_agreed_date` TINYINT
, `logging` TINYINT
, `marketplace` TINYINT
, `mobile_network` TINYINT
, `modified` DECIMAL(14, 4)
, `name` STRING
, `referral_source` STRING
, `role` SMALLINT
, `status` TINYINT
, `testing` TINYINT
, `website` STRING
)
LOCATION 's3://jornaya-dev-us-east-1-udl/accounts/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');
