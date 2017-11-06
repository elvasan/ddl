#!/bin/bash

layer=""
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
              --query-execution-id ${query_id} \
              --query 'QueryExecution.Status.State' \
              --output text`

  while [ RUNNING == ${query_state} ] || [ SUBMITTED == ${query_state} ]; do
    query_state=`aws athena get-query-execution \
                --query-execution-id ${query_id} \
                --query 'QueryExecution.Status.State' \
                --output text`
  done

  if [[ SUCCEEDED != $query_state ]]; then
    echo `date` "DDL execution failed. Exiting!"
    exit 1
  fi
}

while getopts l: opt; do
  case ${opt} in
    l) layer=${OPTARG};;
    *) return 1
  esac
done

for ddl_file in $(find ${layer} -name "*.ddl" | sort); do
  ddl=$(< ${ddl_file})

  echo `date` "Executing DDL in ${ddl_file}..."
  run_athena_query "${ddl}" ${layer}
  echo `date` "Done."
done
