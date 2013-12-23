#!/bin/bash

for SHAPEFILE in $(find . -name "*.shp")
  do
  BASENAME=$(basename $SHAPEFILE .shp)
  DIRNAME=$(dirname $SHAPEFILE)
  SQLFILE="${BASENAME}.sql"
  shp2pgsql -W UTF-8 $SHAPEFILE $BASENAME > "${DIRNAME}/${BASENAME}.sql"
done 
