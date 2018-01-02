CREATE EXTERNAL TABLE IF NOT EXISTS campaign_opt_in (
  account_nm		  string,
  campaign_key  	string, 
  opt_in_ind		  string,
  application_nm	string,
  industry_nm		  string
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
LOCATION 's3://jornaya-${ENV}-us-east-1-rdl/publisher_permissions/campaign_opt_in/';

