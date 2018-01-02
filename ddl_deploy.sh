#!/bin/bash

env=""
layer=""
account_number=""
last_ddl_update_time=0
last_ddl_commit_time=0

# tables_to_update:
# an associative array mapping table name to last ddl update time
declare -A tables_to_update

# apply_tables_to_update
#
# Applies DDL for those tables which need an update
# $1 -> layer
apply_tables_to_update() {
  cd ${1}
  for table in ${!tables_to_update[@]}; do
    cd ${table}
    echo `date` "Updating ${table}"
    for ddl_file in $(find . -name "*.ddl" | sort); do
      ddl=$(< ${ddl_file})
      echo `date` "Executing DDL in ${ddl_file}... "
      run_athena_query "${ddl}" ${layer}
      echo `date` "Done."
    done
    echo `date` "Completed updates to ${table}"
    cd ..
  done
}

# get_last_ddl_update_time
#
# Determines last time DDL was updated on a table by querying AWS Glue
# $1 -> layer
# $2 -> table
get_last_ddl_update_time() {
  output=$(aws glue get-table \
            --database ${1} \
            --name ${2} \
            --query 'Table.Parameters.transient_lastDdlTime' \
            --output text 2>&1)

  result=$?

  # if we have non-zero exit code, treat as table doesn't exist by returning 0
  # else, return the last ddl time we got from the output
  if [[ 0 -ne ${result} ]]; then
    echo 0
  else
    echo ${output}
  fi
}

# get_last_ddl_commit_time
#
# Finds the most recent time that a DDL file for a table has been committed
get_last_ddl_commit_time() {
  for ddl_file in $(find . -name "*.ddl" | sort); do
    time=$(git log -1 --format=%cd \
            --date=raw ${ddl_file} \
            | awk '{ print $1 }')
    if [[ ${last_ddl_commit_time} < ${time} ]]; then
      result=${time}
    fi
  done

  echo ${result}
}

# find_tables_to_update
#
# Makes a hash array of tables in the layer which have new DDL
# $1 -> layer
find_tables_to_update() {
  cd ${1}

  # Loop over all the tables...
  for table in $(/bin/ls -d *); do
    # Get last time DDL was updated
    last_ddl_update_time=$(get_last_ddl_update_time ${1} ${table})

    # if there is no ddl update time, then we need to update it!
    # set last update time to zero so we apply ddl
    if [[ 0 -eq ${last_ddl_update_time} ]]; then
      tables_to_update[${table}]=0
      continue
    fi

    # look at all DDL files for the table, finding the last time any
    # commits were made to these files.
    cd ${table}
    last_ddl_commit_time=$(get_last_ddl_commit_time)

    # if we have commits more recently than the ddl was updated, then
    # we need to update the ddl on this table
    if [[ ${last_ddl_update_time} < ${last_ddl_commit_time} ]]; then
      tables_to_update[${table}]=${last_ddl_update_time}
    fi
    cd ..
  done
  cd ..
}

# print_tables_to_update
print_tables_to_update() {
  echo "Tables which need DDL update:"
  for table in ${!tables_to_update[@]}; do
    echo -e "\t${table}"
  done
}

# run_athena_query
#
# $1 -> statement text
# $2 -> database name
run_athena_query() {

  # The staging environment will read the raw data layer from prod
  # if env is staging and layer is rdl, then point location to prod
  if [[ ${env} == "staging" && ${layer} == "rdl" ]]; then
    query=$(echo ${1} | sed 's/-${ENV}-/-prod-/g')
  else
    query=$(echo ${1} | sed 's/-${ENV}-/'"-${env}-"'/g')
  fi

  query_id=$(aws athena start-query-execution \
              --query-string "${query}" \
              --query-execution-context Database=${2} \
              --result-configuration OutputLocation=${logs_bucket} \
              --query 'QueryExecutionId' \
              --output text)

  query_state=$(aws athena get-query-execution \
              --query-execution-id ${query_id} \
              --query 'QueryExecution.Status.State' \
              --output text)

  while [ RUNNING == ${query_state} ] || [ SUBMITTED == ${query_state} ]; do
    query_state=$(aws athena get-query-execution \
                --query-execution-id ${query_id} \
                --query 'QueryExecution.Status.State' \
                --output text)
  done

  if [[ SUCCEEDED != $query_state ]]; then
    echo `date` "DDL execution failed. Exiting!"
    exit 1
  fi
}

# usage
#
# Prints script usage instructions
usage () {
  echo ""
  echo "./ddl_deploy.sh -a account_number -e env -l layer [-b logs_bucket]"
  echo "    -a: AWS account number of environment"
  echo "    -e: Environment name to deploy (dev, qa, staging, prod)."
  echo "        (NOTE: staging raw data layer will use prod S3 for location)"
  echo "    -l: Data Lake layer to deploy DDL"
  echo "    -b: (optional) S3 Path to logs bucket"
  echo "    -h: print this help message"
}

while getopts a:e:l:b:h opt; do
  case ${opt} in
    a)
      account_number=${OPTARG}
      logs_bucket="s3://aws-athena-query-results-${account_number}-us-east-1"
      ;;
    l) layer=${OPTARG};;
    b) logs_bucket=${OPTARG};;
    e) env=${OPTARG};;
    h)
      usage
      exit 0
      ;;
    \?)
      exit 1
      ;;
    :)
      usage
      exit 1
      ;;
  esac
done

echo `date` "Beginning DDL deploy process for layer ${layer}"
find_tables_to_update ${layer}
print_tables_to_update
apply_tables_to_update ${layer}
echo `date` "DDL deploy process complete for layer ${layer}"
