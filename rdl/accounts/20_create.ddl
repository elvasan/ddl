CREATE EXTERNAL TABLE IF NOT EXISTS `accounts`(
  `active` STRUCT<n:STRING>
, `affiliate_click_network` STRUCT<n:STRING, s:STRING>
, `api_key` STRUCT<s:STRING>
, `api_response` STRUCT<n:STRING>
, `audit_auth` STRUCT<n:STRING>
, `audit_full` STRUCT<n:STRING>
, `audit_pre` STRUCT<n:STRING>
, `audit_self` STRUCT<n:STRING>
, `call_center` STRUCT<s:STRING, n:STRING>
, `code` STRUCT<s:STRING>
, `contribute` STRUCT<n:STRING>
, `create` STRUCT<n:STRING>
, `created` STRUCT<n:STRING>
, `email` STRUCT<s:STRING>
, `entity_code` STRUCT<s:STRING>
, `http_Accept` STRUCT<s:STRING>
, `http_Connection` STRUCT<s:STRING>
, `http_Content-Length` STRUCT<n:STRING>
, `http_Content-Type` STRUCT<s:STRING>
, `http_X-Forwarded-For` STRUCT<s:STRING>
, `http_X-Forwarded-Port` STRUCT<n:STRING>
, `http_X-Forwarded-Proto` STRUCT<s:STRING>
, `id` STRUCT<n:STRING>
, `industry` STRUCT<n:STRING, s:STRING>
, `lead_aggregator` STRUCT<s:STRING, n:STRING>
, `lead_originator` STRUCT<s:STRING, n:STRING>
, `legal_agreed` STRUCT<n:STRING>
, `legal_agreed_date` STRUCT<n:STRING>
, `logging` STRUCT<n:STRING>
, `marketplace` STRUCT<n:STRING>
, `mobile_network` STRUCT<s:STRING, n:STRING>
, `modified` STRUCT<n:STRING>
, `name` STRUCT<s:STRING>
, `primary_user_id` STRUCT<n:STRING>
, `referral_source` STRUCT<s:STRING>
, `role` STRUCT<s:STRING>
, `status` STRUCT<n:STRING>
, `testing` STRUCT<n:STRING>
, `timezone_id` STRUCT<n:STRING, s:STRING>
, `website` STRUCT<s:STRING>
, `web_site` STRUCT<s:STRING>
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION '${LOCATION}';
