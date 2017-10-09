DROP TABLE IF EXISTS accounts;

CREATE EXTERNAL TABLE IF NOT EXISTS accounts(
  `active` STRING
, `affiliate_click_network` STRING
, `api_key` STRING
, `audit_auth` STRING
, `audit_full` STRING
, `audit_pre` STRING
, `audit_self` STRING
, `call_center` STRING
, `code` STRING
, `contribute` STRING
, `create` STRING
, `created` STRING
, `email` STRING
, `entity_code` STRING
, `industry` STRING
, `lead_aggregator` STRING
, `lead_originator` STRING
, `legal_agreed` STRING
, `legal_agreed_date` STRING
, `logging` STRING
, `marketplace` STRING
, `mobile_network` STRING
, `modified` STRING
, `name` STRING
, `referral_source` STRING
, `role` STRING
, `status` STRING
, `testing` STRING
, `website` STRING
)
LOCATION 's3://jornaya-dev-us-east-1-udl/accounts/'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');

