#!/bin/bash

CONTINENT=europe
COUNTRY=norway

#wget http://download.geofabrik.de/europe/germany/nordrhein-westfalen.poly
# BBOX=`./poly2bb.pl $CONTINENT/$COUNTRY.poly | awk -F '[= ]' '{print $8" "$2" "$6" "$4}'`
BBOX="57.553230 2.7246094 72.1279363 33.5742188"

#  -maxwaynodes 256 \
mono Srtm2Osm/Srtm2Osm.exe \
  -incrementid -firstnodeid $(( 1 << 33 )) -firstwayid $(( 1 << 33 )) \
  -cat 400 100 \
  -bounds1 $BBOX \
  -large \
  -o $CONTINENT/$COUNTRY-contours.osm 2>&1 | tee $CONTINENT/$COUNTRY-contours.log

#osmconvert $COUNTRY-contours.osm -B=$COUNTRY.poly  -o=$COUNTRY-contours.osm.pbf

cat $CONTINENT/$COUNTRY-contours.osm  | gzip > $CONTINENT/$COUNTRY-contours.osm.gz

