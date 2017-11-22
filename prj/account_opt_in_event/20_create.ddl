CREATE EXTERNAL TABLE IF NOT EXISTS account_opt_in_event (
  application_key int, 
  account_id      varchar(36), 
  opt_in_ts       timestamp, 
  opt_in_ind      smallint 
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
LOCATION 's3://jornaya-dev-us-east-1-prj/publisher_permissions/setup/account_opt_in_event/';

