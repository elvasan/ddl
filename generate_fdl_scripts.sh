#!/bin/bash

usage() { echo "Usage: $0 [-e <DEV|QA|STAGING|PROD>] [-t <string:tablename>] [-f <string:filepath>]" 1>&2; exit 1; } 

while getopts ":e:d:t:f:" opt; do
    case $opt in
        e)
            e="$OPTARG"
            ;;
        t)
            t="$OPTARG"
            ;;
        f)
            f="$OPTARG"
            ;;
        *)
            usage
            ;;
    esac
done

validate_env() {
    match=0
    envs=(dev DEV qa QA staging STAGING prod PROD)
    for env in "${envs[@]}"; do
        if [[ $env == "${e}" ]]; then
            match=1
            break
        fi
    done
    if [[ $match == 0 ]]; then
        usage
    fi
}

datalayer="fdl"
environment=`tr [A-Z] [a-z] <<< ${e}`
tablename=`tr [A-Z] [a-z] <<< ${t}`

make_table_dir() {
    echo "creating directory: ${datalayer}/${tablename}"
    mkdir ${datalayer}/${tablename}
}

generate_drop_table_script() {
    echo "generating drop table script: ${datalayer}/${tablename}/10_drop.ddl"
    echo "DROP TABLE IF EXISTS ${tablename};" > ${datalayer}/${tablename}/10_drop.ddl
}

generate_create_table_script() {
    echo "generating create table script: ${datalayer}/${tablename}/20_create.ddl"
    cat ${f} > ${datalayer}/${tablename}/20_create.ddl
    sed '$ s/.$//' ${datalayer}/${tablename}/20_create.ddl > ${datalayer}/${tablename}/20_create_tmp.ddl
    mv ${datalayer}/${tablename}/20_create_tmp.ddl ${datalayer}/${tablename}/20_create.ddl
}

generate_msck_repair_script() {
    if [[ `grep 'PARTITIONED' ${datalayer}/${tablename}/20_create.ddl` ]]; then
        echo "generating msck repair script: ${datalayer}/${tablename}/30_msck.ddl"
        echo "MSCK REPAIR TABLE ${tablename};" > ${datalayer}/${tablename}/30_msck.ddl
    fi
}

convert_to_hive() {
    echo "converting ddl scripts to hive format"
    cd ${datalayer}/${tablename}
    export ENV=${environment}
    source "../../convert_vp_to_hive_ddl.sh"
}

# do the stuff
validate_env
make_table_dir
generate_drop_table_script
generate_create_table_script
generate_msck_repair_script
convert_to_hive

