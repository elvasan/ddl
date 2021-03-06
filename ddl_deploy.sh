#!/bin/bash

current_region=$(aws configure get region)
account_number=$(aws sts get-caller-identity --query Account --output text)
logs_bucket="s3://aws-athena-query-results-${account_number}-${current_region}"
last_ddl_update_time=0
last_ddl_commit_time=0

# tables_to_update: a list of tables to update
tables_to_update=()

# apply_tables_to_update
#
# Applies DDL for those tables which need an update
# $1 -> layer
apply_tables_to_update() {
  cd ${1}
  for dir in ${tables_to_update[@]}; do
    initial_dir=$(pwd)
    cd ${dir}
    echo `date` "Updating ${dir##*/}..."
    for ddl_file in $(find . -name "*.ddl" | sort); do
      ddl=$(< ${ddl_file})
      echo `date` "Executing DDL in ${ddl_file}... "
      run_athena_query "${ddl}" ${layer} ${dir}
      echo `date` "Done."
    done
    echo `date` "Completed updates to ${dir##*/}"
    cd ${initial_dir}
  done
}

# create_glue_database
#
# $1 -> layer
# $2 -> user
# $3 -> env
create_glue_database() {
  # If optional user-specific database override has been set...
  if [[ ! -z ${2} ]]; then
    # ...and env is not dev, exit.
    # This override is only applicable to dev environment.
    if [[ "dev" != ${3} ]]; then
      echo `date` "User-specific override only applicable to dev environment."
      echo `date` "Set -e dev to use user-specific database and locations."
      exit 1
    fi

    db="${2}_${1}"
  else
    db=${1}
  fi

  # Otherwise, make sure user has a Glue Database, else create one.
  output=$(aws glue get-database --name ${db} 2>&1 > /dev/null)
  result=$?

  if [[ 0 -ne ${result} ]]; then
    echo `date` "Creating database ${db}".
    aws glue create-database --database-input Name=${db}
  fi
}

# get_db_name
#
# $1 -> layer
get_db_name() {

  # if user override is set, append user to layer name
  if [[ ! -z ${user} ]]; then
    db="${user}_${1}"
  else
    db="${1}"
  fi

  echo ${db}

}

# get_last_ddl_update_time
#
# Determines last time DDL was updated on a table by querying AWS Glue
# $1 -> layer
# $2 -> table
get_last_ddl_update_time() {

  db_name=$(get_db_name $1)

  output=$(aws glue get-table \
            --database ${db_name} \
            --name ${2} \
            --query 'Table.Parameters.transient_lastDdlTime' \
            --output text 2>&1 > /dev/null)

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

# get_s3_location
#
# Returns proper S3 location string for a tables
#
# $1 -> env
# $2 -> layer
# $3 -> path
get_s3_location() {

  # If user location optional parameter has been passed, override location
  # if env is staging and layer is rdl, then point location to prod
  # (The staging environment will read the raw data layer from prod)
  # else set location as normal
  if [[ ! -z ${user} ]]; then
    s3_location="s3://jornaya-${1}-${current_region}-${2}/${user}/${3}/"

    ## if s3 location for developer isn't there, create it
    aws s3 ls ${s3_location} 2>&1 > /dev/null
    if [[ 0 -ne $? ]]; then
      aws s3api put-object --bucket $(echo ${s3_location} | cut -d '/' -f 3) \
       --key ${user}/${3}/ \
       2>&1 > /dev/null
    fi

  elif [[ ${1} == "staging" && ${2} == "rdl" ]]; then
    s3_location="s3://jornaya-prod-${current_region}-${2}/${3}/"
  else
    s3_location="s3://jornaya-${1}-${current_region}-${2}/${3}/"
  fi

  echo ${s3_location}

}

# find_tables_to_update
#
# Makes a hash array of tables in the layer which have new DDL
# $1 -> layer
find_tables_to_update() {
  cd ${1}

  # Loop over all the directories...
  for dir in $(find . -type d -exec sh -c '(ls -p "{}"|grep />/dev/null)||echo "{}"' \; | cut -c 3-); do

    # Get current directory location so we can get back here later
    initial_dir=$(pwd)

    # if table contains a slash,
    # then actual table name is lowest level leaf dir
    if [[ "${dir}" == *\/* ]]; then
      table=${dir##*/}
    else
      table=${dir}
    fi

    # Get last time DDL was updated
    last_ddl_update_time=$(get_last_ddl_update_time ${1} ${table})

    # if there is no ddl update time, then we need to update it!
    # set last update time to zero so we apply ddl
    if [[ 0 -eq ${last_ddl_update_time} ]]; then
      tables_to_update+=(${dir})
      continue
    fi

    # look at all DDL files for the table, finding the last time any
    # commits were made to these files.
    cd ${dir}
    last_ddl_commit_time=$(get_last_ddl_commit_time)

    # if we have commits more recently than the ddl was updated, then
    # we need to update the ddl on this table
    if [[ ${last_ddl_update_time} < ${last_ddl_commit_time} ]]; then
      tables_to_update+=$(${dir})
    fi
    cd ${initial_dir}
  done
  cd ..
}

# print_tables_to_update
print_tables_to_update() {
  echo "Tables which need DDL update:"
  for table in ${tables_to_update[@]}; do
    echo -e "\t${table}"
  done
}

# run_athena_query
#
# $1 -> statement text
# $2 -> layer
# $3 -> path
run_athena_query() {

  location=$(get_s3_location ${env} ${2} ${3})
  query=$(echo ${1} | sed 's|${LOCATION}|'"${location}"'|g')
  db_name=$(get_db_name $2)

  query_id=$(aws athena start-query-execution \
              --query-string "${query}" \
              --query-execution-context Database=${db_name} \
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
  echo "./ddl_deploy.sh -e env -l layer [-b logs_bucket -u]"
  echo "    -e: Environment name to deploy (dev, qa, staging, prod)."
  echo "        (NOTE: staging raw data layer will use prod S3 for location)"
  echo "    -l: Data Lake layer to deploy DDL (rdl, udl, fdl, lrf, prj)"
  echo "    -b: (optional) S3 Path to logs bucket"
  echo "    -u: (optional) Deploy user specific database and table locations"
  echo "    -h: print this help message"
}

while getopts e:l:b:uh opt; do
  case ${opt} in
    l) layer=${OPTARG};;
    b) logs_bucket=${OPTARG};;
    e) env=${OPTARG};;
    u) user=$(aws iam get-user --profile jornaya-core --query User.UserName --output text);;
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

# env and layer are required parameters, if not set, exit
if [[ -z ${layer} || -z ${env} ]]; then
  echo `date` "Environment and layer are required parameters."
  usage
  exit 1
fi

create_glue_database ${layer} ${user} ${env}

echo `date` "Beginning DDL deploy process for layer ${layer}"
find_tables_to_update ${layer}
print_tables_to_update
apply_tables_to_update ${layer}
echo `date` "DDL deploy process complete for layer ${layer}"
