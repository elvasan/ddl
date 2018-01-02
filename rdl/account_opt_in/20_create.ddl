CREATE EXTERNAL TABLE IF NOT EXISTS account_opt_in (
  account_nm      string, 
  account_id      string, 
  opt_in_ind      string,
  application_nm  string,
  industry_nm	    string
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
LOCATION 's3://jornaya-${ENV}-us-east-1-rdl/publisher_permissions/account_opt_in/';

