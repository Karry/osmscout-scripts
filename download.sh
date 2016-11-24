#!/bin/bash

if [ $# -lt 2 ] ; then
	echo "No continent / country specified"
	exit 1
fi
CONTINENT=$1
COUNTRY=$2

wget "http://download.geofabrik.de/$CONTINENT/$COUNTRY-latest.osm.pbf" -O$CONTINENT/$COUNTRY-latest.osm.pbf || exit 1
wget "http://download.geofabrik.de/$CONTINENT/$COUNTRY.poly"           -O$CONTINENT/$COUNTRY.poly           || exit 1
