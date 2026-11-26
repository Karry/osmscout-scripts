#!/bin/bash

if [ $# -lt 2 ] ; then
	echo "No continent / country specified"
	exit 1
fi
if [ $# -eq 3 ] ; then
	CONTINENT=$1
	COUNTRY=$2
	REGION=$3
	BASEURL="https://download.geofabrik.de/$CONTINENT/$COUNTRY/$REGION/$REGION"
	BASEFILE="$CONTINENT/$COUNTRY/$REGION"
else
	CONTINENT=$1
	COUNTRY=$2
	BASEURL="https://download.geofabrik.de/$CONTINENT/$COUNTRY"
	BASEFILE="$CONTINENT/$COUNTRY"
fi

# wget exits with code 8 on "429 Too Many Requests"
# https://www.gnu.org/software/wget/manual/html_node/Exit-Status.html
exitCode=1
while [ $exitCode -ne 0 ] ; do
	wget --read-timeout=60 "$BASEURL-latest.osm.pbf" -O$BASEFILE-latest.osm.pbf
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
	wget --read-timeout=60 "$BASEURL.poly" -O$BASEFILE.poly
	exitCode=$?
	if [ $exitCode -eq 8 ] ; then
		echo "Wait an hour..."
		sleep 3600 
	fi
done

if [ $exitCode -ne 0 ] ; then
	exit $exitCode
fi
