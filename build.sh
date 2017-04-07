#!/bin/bash

if [ $# -lt 2 ] ; then
	echo "No continent / country specified"
	exit 1
fi
CONTINENT=$1
COUNTRY=$2
BASEDIR=$PWD

##############################################################

if [ "$DOWNLOAD" != "skip" ] ; then
	./download.sh $CONTINENT $COUNTRY || exit 1
fi

###############################################################

if [ "$CONTOURS" != "skip" ] ; then
if [ ! -f $BASEDIR/$CONTINENT/$COUNTRY-contours.osm ] ; then
	if [ -f $BASEDIR/$CONTINENT/$COUNTRY-contours.osm.gz ] ; then
		zcat $BASEDIR/$CONTINENT/$COUNTRY-contours.osm.gz > $BASEDIR/$CONTINENT/$COUNTRY-contours.osm
	else
		./prepare-contour.sh $CONTINENT $COUNTRY || exit 1
	fi
fi
fi

###############################################################

cd /var/btrfs/@maps/
mkdir -p "$CONTINENT-$COUNTRY"

# ../$COUNTRY-latest.osm.pbf \
# ../$COUNTRY-latest.osm \
if [ "$CONTOURS" != "skip" ] ; then
  time OSMScoutImport \
   -d \
   --eco true \
   --typefile $BASEDIR/map.ost \
   --rawWayBlockSize $(( 4 * 1000000 )) \
   --altLangOrder en \
   --destinationDirectory "$CONTINENT-$COUNTRY" \
   $BASEDIR/$CONTINENT/$COUNTRY-latest.osm.pbf \
   $BASEDIR/$CONTINENT/$COUNTRY-contours.osm \
   $BASEDIR/$CONTINENT/$COUNTRY.poly \
   2>&1 | tee "$CONTINENT-$COUNTRY/import.log"
else
  time OSMScoutImport \
   -d \
   --eco true \
   --typefile $BASEDIR/map.ost \
   --rawWayBlockSize $(( 4 * 1000000 )) \
   --altLangOrder en \
   --destinationDirectory "$CONTINENT-$COUNTRY" \
   $BASEDIR/$CONTINENT/$COUNTRY-latest.osm.pbf \
   $BASEDIR/$CONTINENT/$COUNTRY.poly \
   2>&1 | tee "$CONTINENT-$COUNTRY/import.log"
fi

if [ `tail -n 1 "$CONTINENT-$COUNTRY/import.log" | grep -c "OK"` -ne 1 ] ; then
	echo "Import of $CONTINENT / $COUNTRY fails!"
	exit 1
fi

$BASEDIR/upload.sh  $CONTINENT $COUNTRY || exit 1
$BASEDIR/cleanup.sh $CONTINENT $COUNTRY || exit 1
