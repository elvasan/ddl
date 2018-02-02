CREATE EXTERNAL TABLE IF NOT EXISTS `company` (
  `account_id` VARCHAR(36)
, `company_nm` VARCHAR(80)
, `entity_id` VARCHAR(36)
, `is_active_ind` SMALLINT
, `role_nm` VARCHAR(255)
, `insert_ts` TIMESTAMP
, `insert_job_run_id` VARCHAR(255)
, `source_ts` TIMESTAMP
)
STORED AS PARQUET
LOCATION '${LOCATION}'
TBLPROPERTIES ('PARQUET.COMPRESS'='SNAPPY');
