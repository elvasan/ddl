DROP TABLE IF EXISTS hash_mapping;

CREATE TABLE IF NOT EXISTS hash_mapping(
  canonical_hash_value    varchar(32) NOT NULL ENCODE LZO,
  hash_type_cd            smallint NOT NULL ENCODE BYTEDICT,
  hash_value              varchar(128) NOT NULL ENCODE LZO,
  insert_ts               timestamp,
  insert_batch_run_id     int NOT NULL,
  insert_job_run_id       int NOT NULL,
  source_ts               timestamp)
DISTKEY(canonical_hash_value);