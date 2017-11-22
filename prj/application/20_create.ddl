CREATE EXTERNAL TABLE IF NOT EXISTS application (
  application_key int, 
  application_nm  varchar(50) 
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
LOCATION 's3://jornaya-dev-us-east-1-prj/publisher_permissions/setup/application/';
