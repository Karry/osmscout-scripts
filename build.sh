#!/bin/bash

if [ $# -lt 2 ] ; then
	echo "No continent / country specified"
	exit 1
fi
CONTINENT=$1
COUNTRY=$2
BASEDIR=$PWD

##############################################################

if [ "$CONTOURS" != "skip" ] ; then
  if [ ! -f $BASEDIR/$CONTINENT/$COUNTRY-contours-$CONTOURS.osm.pbf ] ; then
    ./prepare-contour-phyghtmap.sh $CONTINENT $COUNTRY || exit 1
  fi
fi

###############################################################

if [ "$DOWNLOAD" != "skip" ] ; then
	./download.sh $CONTINENT $COUNTRY || exit 1
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
   --rawCoordBlockSize $(( 60 * 1000000 )) \
   --rawWayBlockSize $(( 4 * 1000000 )) \
   --altLangOrder en \
   --destinationDirectory "$CONTINENT-$COUNTRY" \
   --bounding-polygon $BASEDIR/$CONTINENT/$COUNTRY.poly \
   $BASEDIR/$CONTINENT/$COUNTRY-latest.osm.pbf \
   $BASEDIR/$CONTINENT/$COUNTRY-contours-$CONTOURS.osm.pbf \
   2>&1 | tee "$CONTINENT-$COUNTRY/import.log"
else
  time OSMScoutImport \
   -d \
   --eco true \
   --typefile $BASEDIR/map.ost \
   --rawCoordBlockSize $(( 60 * 1000000 )) \
   --rawWayBlockSize $(( 4 * 1000000 )) \
   --altLangOrder en \
   --destinationDirectory "$CONTINENT-$COUNTRY" \
   --bounding-polygon $BASEDIR/$CONTINENT/$COUNTRY.poly \
   $BASEDIR/$CONTINENT/$COUNTRY-latest.osm.pbf \
   2>&1 | tee "$CONTINENT-$COUNTRY/import.log"
fi

if [ `tail -n 1 "$CONTINENT-$COUNTRY/import.log" | grep -c "OK"` -ne 1 ] ; then
	echo "Import of $CONTINENT / $COUNTRY fails!"
	exit 1
fi

$BASEDIR/upload.sh  $CONTINENT $COUNTRY || exit 1
$BASEDIR/cleanup.sh $CONTINENT $COUNTRY || exit 1
