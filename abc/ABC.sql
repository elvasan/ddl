-- Create Data base
create database AuditBalanceControl;

-- Create schemas
create schema if not exists abc
-- Create tables
CREATE TABLE IF NOT EXISTS application
(
    application_id INTEGER NOT NULL AUTO_INCREMENT,
    application_nm VARCHAR(25) NOT NULL UNIQUE,
    last_update_dttm TIMESTAMP NOT NULL,
    last_update_uid VARCHAR(25) NOT NULL,
    enable_ind CHARACTER(1) NOT NULL
        CHECK ('Y' or 'N'),
    PRIMARY KEY(application_id)
);

CREATE TABLE IF NOT EXISTS application_property
(
    application_id INTEGER NOT NULL,
    property_nm VARCHAR(50) NOT NULL,
    property_type_txt VARCHAR(25) NOT NULL,
    property_value_txt VARCHAR(250) NOT NULL,
    last_update_dttm TIMESTAMP NOT NULL,
    last_update_uid VARCHAR(25) NOT NULL,
    enable_ind CHARACTER(1) NOT NULL
        CHECK ('Y' or 'N'),
    PRIMARY KEY(application_id, property_nm)
);

CREATE TABLE IF NOT EXISTS batch
(
    batch_id INTEGER NOT NULL AUTO_INCREMENT,
    application_id INTEGER NOT NULL,
    batch_nm VARCHAR(25) NOT NULL UNIQUE,
    last_update_dttm TIMESTAMP NOT NULL,
    last_update_uid VARCHAR(25) NOT NULL,
    enable_ind CHARACTER(1) NOT NULL
        CHECK ('Y' or 'N'),
    PRIMARY KEY(batch_id)
);

CREATE TABLE IF NOT EXISTS batch_property
(
    batch_id INTEGER NOT NULL,
    property_nm VARCHAR(50) NOT NULL,
    property_type_txt VARCHAR(25) NOT NULL,
    property_value_txt VARCHAR(250) NOT NULL,
    last_update_dttm TIMESTAMP NOT NULL,
    last_update_uid VARCHAR(25) NOT NULL,
    enable_ind CHARACTER(1) NOT NULL
        CHECK ('Y' or 'N'),
    PRIMARY KEY(batch_id, property_nm)
);

CREATE TABLE IF NOT EXISTS job
(
    job_id BIGINT NOT NULL AUTO_INCREMENT,
    batch_id INTEGER NOT NULL,
    job_nm VARCHAR(25) NOT NULL UNIQUE,
    job_type_txt VARCHAR(25) NOT NULL,
    last_update_dttm TIMESTAMP NOT NULL,
    last_update_uid VARCHAR(25) NOT NULL,
    enable_ind CHARACTER(1) NOT NULL
        CHECK ('Y' or 'N'),
    PRIMARY KEY(job_id)
);

CREATE TABLE IF NOT EXISTS job_property
(
    job_id BIGINT NOT NULL,
    property_nm VARCHAR(50) NOT NULL,
    property_type_txt VARCHAR(25) NOT NULL,
    property_value_txt VARCHAR(250) NOT NULL,
    last_update_dttm TIMESTAMP NOT NULL,
    last_update_uid VARCHAR(25) NOT NULL,
    enable_ind CHARACTER(1) NOT NULL
        CHECK ('Y' or 'N'),
    PRIMARY KEY(job_id, property_nm)
);

CREATE TABLE IF NOT EXISTS batch_run
(
    batch_run_id INTEGER NOT NULL AUTO_INCREMENT,
    batch_id INTEGER NOT NULL,
    batch_run_nm VARCHAR(15) NOT NULL,
    batch_run_dt TIMESTAMP NOT NULL,
    batch_run_status_ind VARCHAR(10) NOT NULL,
    batch_start_dttm TIMESTAMP NOT NULL,
    batch_end_dttm TIMESTAMP,
    PRIMARY KEY(batch_run_id)
);

CREATE TABLE IF NOT EXISTS job_run
(
    job_run_id INTEGER NOT NULL AUTO_INCREMENT,
    batch_run_id INTEGER NOT NULL,
    job_id BIGINT NOT NULL,
    job_status_cd VARCHAR(15) NOT NULL,
    job_start_dttm TIMESTAMP NOT NULL,
    job_end_dttm TIMESTAMP,
    init_job_start_dttm TIMESTAMP NOT NULL,
    job_restart_cnt INTEGER NOT NULL,
    PRIMARY KEY(job_run_id)
);

CREATE TABLE IF NOT EXISTS job_stats
(
    job_run_id INTEGER NOT NULL,
    job_stat_nm VARCHAR(25) NOT NULL,
    job_stat_value_num INTEGER,
    job_stat_value_dttm TIMESTAMP,
    job_stat_desc VARCHAR(250) NOT NULL,
    job_stat_update_dttm TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS batch_dependency_xref
(
    batch_id INTEGER NOT NULL,
    dependent_batch_id INTEGER,
    last_update_dttm TIMESTAMP,
    last_update_uid VARCHAR(25),
    enable_ind CHARACTER(1),
    PRIMARY KEY(batch_id)
);


-- Create FKs
ALTER TABLE application_property
    ADD    FOREIGN KEY (application_id)
    REFERENCES application(application_id)
    MATCH SIMPLE
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

ALTER TABLE batch
    ADD    FOREIGN KEY (application_id)
    REFERENCES application(application_id)
    MATCH SIMPLE
;

ALTER TABLE batch_property
    ADD    FOREIGN KEY (batch_id)
    REFERENCES batch(batch_id)
    MATCH SIMPLE
;

ALTER TABLE job
    ADD    FOREIGN KEY (batch_id)
    REFERENCES batch(batch_id)
    MATCH SIMPLE
;

ALTER TABLE job_property
    ADD    FOREIGN KEY (job_id)
    REFERENCES job(job_id)
    MATCH SIMPLE
;

ALTER TABLE batch_run
    ADD    FOREIGN KEY (batch_id)
    REFERENCES batch(batch_id)
    MATCH SIMPLE
;

ALTER TABLE job_run
    ADD    FOREIGN KEY (batch_run_id)
    REFERENCES batch_run(batch_run_id)
    MATCH SIMPLE
;

ALTER TABLE job_run
    ADD    FOREIGN KEY (job_id)
    REFERENCES job(job_id)
    MATCH SIMPLE
;

ALTER TABLE job_stats
    ADD    FOREIGN KEY (job_run_id)
    REFERENCES job_run(job_run_id)
    MATCH SIMPLE
;

ALTER TABLE batch_dependency_xref
    ADD    FOREIGN KEY (batch_id)
    REFERENCES batch(batch_id)
    MATCH SIMPLE
;

ALTER TABLE batch_dependency_xref
    ADD    FOREIGN KEY (dependent_batch_id)
    REFERENCES batch(batch_id)
    MATCH SIMPLE
;

ALTER TABLE batch_dependency_xref
    ADD    FOREIGN KEY (batch_id)
    REFERENCES batch_dependency_xref(dependent_batch_id)
    MATCH SIMPLE
;

-- Create Indexes
