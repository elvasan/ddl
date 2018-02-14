CREATE EXTERNAL TABLE IF NOT EXISTS application (
  application_key    smallint, 
  application_nm     varchar(50), 
  default_opt_in_ind smallint 
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
LOCATION '${LOCATION}';
