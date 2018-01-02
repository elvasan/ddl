CREATE EXTERNAL TABLE IF NOT EXISTS application (
  application_key    smallint, 
  application_nm     string,
  default_opt_in_ind smallint
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
LOCATION 's3://jornaya-${ENV}-us-east-1-rdl/publisher_permissions/application/';
