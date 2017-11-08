#!/bin/bash -x
#
# convert_vp_to_hive_ddl.sh
#
# Translates Visual Paradigm generated DDL files into environment agnostic
# appliable DDL files.

for ddl_file in `find . -name "*.ddl"`; do
  sed -i '' 's/CREATE TABLE/CREATE EXTERNAL TABLE IF NOT EXISTS/g' $ddl_file
  sed -i '' 's/ NOT NULL,/,/g' $ddl_file
  sed -i '' 's/ char(/ varchar(/g' $ddl_file
  sed -i '' 's/  PRIMARY KEY (.*))/)/g' $ddl_file
  sed -i '' 's/int2/smallint/g' $ddl_file
  sed -i '' 's/int4/int/g' $ddl_file
  sed -i '' 's/int8/bigint/g' $ddl_file
  sed -i '' "s/-dev-/-${ENV}-/g" $ddl_file
done
