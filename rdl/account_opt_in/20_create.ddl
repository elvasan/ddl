CREATE EXTERNAL TABLE IF NOT EXISTS account_opt_in (
  account_nm      string, 
  account_id      string, 
  opt_in_ind      string,
  application_nm  string,
  industry_nm	    string
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
LOCATION '${LOCATION}';

