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

VERSION=10

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
   2>&1 | tee "$CONTINENT-$COUNTRY/import.log"
fi

if [ `tail -n 1 "$CONTINENT-$COUNTRY/import.log" | grep -c "OK"` -ne 1 ] ; then
	echo "Import of $CONTINENT / $COUNTRY fails!"
	exit 1
fi

tar -cf "$CONTINENT-$COUNTRY.tar" \
  "$CONTINENT-$COUNTRY/types.dat" \
  "$CONTINENT-$COUNTRY/bounding.dat" \
  "$CONTINENT-$COUNTRY/nodes.dat" \
  "$CONTINENT-$COUNTRY/areas.dat" \
  "$CONTINENT-$COUNTRY/ways.dat" \
  "$CONTINENT-$COUNTRY/areanode.idx" \
  "$CONTINENT-$COUNTRY/areaarea.idx" \
  "$CONTINENT-$COUNTRY/areaway.idx" \
  "$CONTINENT-$COUNTRY/areasopt.dat" \
  "$CONTINENT-$COUNTRY/waysopt.dat" \
  "$CONTINENT-$COUNTRY/location.idx" \
  "$CONTINENT-$COUNTRY/water.idx" \
  "$CONTINENT-$COUNTRY/intersections.dat" \
  "$CONTINENT-$COUNTRY/intersections.idx" \
  "$CONTINENT-$COUNTRY/router.dat" \
  "$CONTINENT-$COUNTRY/router2.dat" \
  "$CONTINENT-$COUNTRY/router.idx" \
  "$CONTINENT-$COUNTRY/textloc.dat" \
  "$CONTINENT-$COUNTRY/textother.dat" \
  "$CONTINENT-$COUNTRY/textpoi.dat" \
  "$CONTINENT-$COUNTRY/textregion.dat"


tar -cf "$CONTINENT-$COUNTRY.debug.tar" \
  "$CONTINENT-$COUNTRY/location_full.txt" \
  "$CONTINENT-$COUNTRY/location_region.txt" \
  "$CONTINENT-$COUNTRY/nodes.idmap" \
  "$CONTINENT-$COUNTRY/areas.idmap" \
  "$CONTINENT-$COUNTRY/ways.idmap"


DATE=`date +"%Y%m%d"`
ssh root@home "mkdir -p            /media/web/osmscout/$CONTINENT/$COUNTRY-$VERSION-$DATE"
scp "$CONTINENT-$COUNTRY.tar"       root@home:/media/web/osmscout/$CONTINENT/$COUNTRY-$VERSION-$DATE.tar
scp "$CONTINENT-$COUNTRY.debug.tar" root@home:/media/web/osmscout/$CONTINENT/$COUNTRY-$VERSION-$DATE.debug.tar
# scp $CONTINENT-$COUNTRY/*.log       root@home:/media/web/osmscout/$CONTINENT/$COUNTRY-$VERSION-$DATE/
# scp $CONTINENT-$COUNTRY/*.html      root@home:/media/web/osmscout/$CONTINENT/$COUNTRY-$VERSION-$DATE/

scp \
  $CONTINENT-$COUNTRY/*.log \
  $CONTINENT-$COUNTRY/*.html \
  "$CONTINENT-$COUNTRY/types.dat" \
  "$CONTINENT-$COUNTRY/bounding.dat" \
  "$CONTINENT-$COUNTRY/nodes.dat" \
  "$CONTINENT-$COUNTRY/areas.dat" \
  "$CONTINENT-$COUNTRY/ways.dat" \
  "$CONTINENT-$COUNTRY/areanode.idx" \
  "$CONTINENT-$COUNTRY/areaarea.idx" \
  "$CONTINENT-$COUNTRY/areaway.idx" \
  "$CONTINENT-$COUNTRY/areasopt.dat" \
  "$CONTINENT-$COUNTRY/waysopt.dat" \
  "$CONTINENT-$COUNTRY/location.idx" \
  "$CONTINENT-$COUNTRY/water.idx" \
  "$CONTINENT-$COUNTRY/intersections.dat" \
  "$CONTINENT-$COUNTRY/intersections.idx" \
  "$CONTINENT-$COUNTRY/router.dat" \
  "$CONTINENT-$COUNTRY/router2.dat" \
  "$CONTINENT-$COUNTRY/router.idx" \
  "$CONTINENT-$COUNTRY/textloc.dat" \
  "$CONTINENT-$COUNTRY/textother.dat" \
  "$CONTINENT-$COUNTRY/textpoi.dat" \
  "$CONTINENT-$COUNTRY/textregion.dat" \
  root@home:/media/web/osmscout/$CONTINENT/$COUNTRY-$VERSION-$DATE/

source ./secret.sh
curl -vvv "https://osmscout.karry.cz/addmap.php?secret=$secret&map=$CONTINENT/$COUNTRY&version=$VERSION&directory=$CONTINENT/$COUNTRY-$VERSION-$DATE"

  
rm -rf "/var/btrfs/@maps/$CONTINENT-$COUNTRY"
rm     "/var/btrfs/@maps/$CONTINENT-$COUNTRY.tar"
rm     "/var/btrfs/@maps/$CONTINENT-$COUNTRY.debug.tar"

rm $BASEDIR/$CONTINENT/$COUNTRY-contours.osm
rm $BASEDIR/$CONTINENT/$COUNTRY-latest.osm.pbf
