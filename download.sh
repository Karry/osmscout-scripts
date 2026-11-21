#!/bin/bash

if [ $# -lt 2 ] ; then
	echo "No continent / country specified"
	exit 1
fi
CONTINENT=$1
COUNTRY=$2

# wget exits with code 8 on "429 Too Many Requests"
# https://www.gnu.org/software/wget/manual/html_node/Exit-Status.html
exitCode=1
while [ $exitCode -ne 0 ] ; do
	wget --read-timeout=300 "http://download.geofabrik.de/$CONTINENT/$COUNTRY-latest.osm.pbf" -O$CONTINENT/$COUNTRY-latest.osm.pbf
	exitCode=$?
	if [ $exitCode -eq 8 ] ; then
		echo "Wait an hour..."
		sleep 3600 
	fi
done

if [ $exitCode -ne 0 ] ; then
	exit $exitCode
fi

exitCode=1
while [ $exitCode -ne 0 ] ; do
	wget --read-timeout=300 "http://download.geofabrik.de/$CONTINENT/$COUNTRY.poly"           -O$CONTINENT/$COUNTRY.poly
	exitCode=$?
	if [ $exitCode -eq 8 ] ; then
		echo "Wait an hour..."
		sleep 3600 
	fi
done

if [ $exitCode -ne 0 ] ; then
	exit $exitCode
fi
