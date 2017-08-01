#!/bin/bash

if [ $# -lt 2 ] ; then
	echo "No continent / country specified"
	exit 1
fi
CONTINENT=$1
COUNTRY=$2

#wget http://download.geofabrik.de/europe/germany/nordrhein-westfalen.poly
BBOX=`./poly2bb.pl $CONTINENT/$COUNTRY.poly | awk -F '[= ]' '{print $8" "$2" "$6" "$4}'`

#  -maxwaynodes 256 \
mono Srtm2Osm/Srtm2Osm.exe \
  -incrementid -firstnodeid $(( 1 << 33 )) -firstwayid $(( 1 << 33 )) \
  -cat 400 100 \
  -bounds1 $BBOX \
  -large \
  -o $CONTINENT/$COUNTRY-contours.osm 2>&1 | tee $CONTINENT/$COUNTRY-contours.log ; test ${PIPESTATUS[0]} -eq 0 || exit 1

#osmconvert $COUNTRY-contours.osm -B=$COUNTRY.poly  -o=$COUNTRY-contours.osm.pbf

cat $CONTINENT/$COUNTRY-contours.osm  | gzip > $CONTINENT/$COUNTRY-contours.osm.gz

