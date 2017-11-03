#!/bin/bash

ddl_dirs=( "rdl" "udl" "fdl" "prj" )
logs_bucket="s3://aws-athena-query-results-794223901232-us-east-1"

# run_athena_query
#
# $1 -> statement text
# $2 -> database name
run_athena_query() {
  query_id=`aws athena start-query-execution \
              --query-string "${1}" \
              --query-execution-context Database=${2} \
              --result-configuration OutputLocation=${logs_bucket} \
              --query 'QueryExecutionId' \
              --output text`

  query_state=`aws athena get-query-execution \
              --query-execution-id $query_id \
              --query 'QueryExecution.Status.State' \
              --output text`

  while [ RUNNING == $query_state ] || [ SUBMITTED == $query_state ]; do
    sleep 2
    query_state=`aws athena get-query-execution \
                --query-execution-id $query_id \
                --query 'QueryExecution.Status.State' \
                --output text`
  done

  if [[ SUCCEEDED != $query_state ]]; then
    echo `date` "DDL execution failed. Exiting!"
    exit 1
  fi
}

for dir in ${ddl_dirs[@]}; do
  for ddl_file in $(find ${dir}/. -name "*.ddl"); do
    ddl=$(< ${ddl_file})
    drop_statement=$(echo ${ddl} | awk -F ";" '{print $1}')
    create_statement=$(echo ${ddl} | awk -F ";" '{print $2}')

    echo `date` "Executing DDL in ${ddl_file}..."
    run_athena_query "${drop_statement}" ${dir}
    run_athena_query "${create_statement}" ${dir}
    echo `date` "Done."
  done
done
