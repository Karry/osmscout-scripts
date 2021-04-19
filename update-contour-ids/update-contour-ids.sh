#!/bin/bash
# find . -name \*contours\*.osm.pbf -exec update-contour-ids.sh {} \;
if [ $# -lt 1 ] ; then
  echo "Expecting one argument" >&2
  exit 1
fi
set -e
FILE=$1
if [ -f "$FILE.backup" ] ; then
  echo "$FILE.backup exist already"
else
  echo "Converting $FILE to osm xml"
  time osmconvert "$FILE" -o=tmp.osm
  DIR=$(dirname $0)
  echo "Update ids and refs"
  time "$DIR/cmake-build-relwithdebinfo/update-contour-ids" tmp.osm tmp2.osm
  mv "$FILE" "$FILE.backup"
  echo "Converting back to bpf file $FILE"
  time osmconvert "tmp2.osm" "-o=${FILE}"
fi
