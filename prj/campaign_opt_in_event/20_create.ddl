CREATE EXTERNAL TABLE IF NOT EXISTS campaign_opt_in_event (
  application_key int, 
  campaign_key    varchar(36), 
  opt_in_ts       timestamp, 
  opt_in_ind      smallint 
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
LOCATION 's3://jornaya-dev-us-east-1-prj/publisher_permissions/setup/campaign_opt_in_event/';

