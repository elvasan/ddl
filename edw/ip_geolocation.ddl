DROP TABLE IF EXISTS ip_geolocation;

CREATE TABLE IF NOT EXISTS ip_geolocation(
  `ip_geolocation_key` varchar(36) NOT NULL ENCODE LZO,
  `country_cd` smallint NOT NULL ENCODE BYTEDICT,
  `region_cd` smallint NOT NULL ENCODE BYTEDICT,
  `city_nm` varchar(255) NOT NULL ENCODE LZO,
  `postal_cd` varchar(8) NOT NULL ENCODE LZO,
  `area_cd` varchar(3) NOT NULL ENCODE LZO,
  `isp_nm` varchar(50) NOT NULL ENCODE LZO,
  `insert_ts` timestamp,
  `insert_batch_run_id` int NOT NULL,
  `insert_job_run_id` int NOT NULL,
  `source_ts` timestamp)
DISTKEY(ip_geolocation_key);
