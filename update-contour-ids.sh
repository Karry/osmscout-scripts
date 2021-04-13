#!/bin/bash

if [ $# -lt 1 ] ; then
  echo "Expecting one argument" >&2
  exit 1
fi
set -e
FILE=$1
echo "Converting $FILE to osm xml"
time osmconvert "$FILE" -o=tmp.osm
DIR=$(dirname $0)
echo "Update ids and refs"
time "$DIR/update-contour-ids.py" tmp.osm > tmp2.osm
mv "$FILE" "$FILE.backup"
echo "Converting back to bpf file $FILE"
time osmconvert "tmp2.osm" "-o=$FILE"
