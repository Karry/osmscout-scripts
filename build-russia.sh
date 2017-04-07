#!/bin/bash

#CONTINENT=$1
COUNTRY=russia
BASEDIR=$PWD

##############################################################

#./download.sh $CONTINENT $COUNTRY || exit 1
wget "http://download.geofabrik.de/$COUNTRY-latest.osm.pbf" -O$COUNTRY-latest.osm.pbf || exit 1
wget "http://download.geofabrik.de/$COUNTRY.poly"           -O$COUNTRY.poly           || exit 1

###############################################################

# if [ ! -f $BASEDIR/$COUNTRY-contours.osm ] ; then
# 	if [ -f $BASEDIR/$COUNTRY-contours.osm.gz ] ; then
# 		zcat $BASEDIR/$COUNTRY-contours.osm.gz > $BASEDIR/$COUNTRY-contours.osm
# 	else
# 		./prepare-contour.sh $CONTINENT $COUNTRY || exit 1
# 	fi
# fi
###############################################################

cd /var/btrfs/@maps/
mkdir -p "$COUNTRY"

VERSION=12

# ../$COUNTRY-latest.osm.pbf \
# ../$COUNTRY-latest.osm \
#  $BASEDIR/$COUNTRY-contours.osm \
time OSMScoutImport \
 -d \
 --eco true \
 --typefile $BASEDIR/map.ost \
 --rawWayBlockSize $(( 4 * 1000000 )) \
 --altLangOrder en \
 --destinationDirectory "$COUNTRY" \
 $BASEDIR/$COUNTRY-latest.osm.pbf \
 2>&1 | tee "$COUNTRY/import.log"
 
if [ `tail -n 1 "$COUNTRY/import.log" | grep -c "OK"` -ne 1 ] ; then
	echo "Import of $COUNTRY fails!"
	exit 1
fi

tar -cf "$COUNTRY.tar" \
  "$COUNTRY/types.dat" \
  "$COUNTRY/bounding.dat" \
  "$COUNTRY/nodes.dat" \
  "$COUNTRY/areas.dat" \
  "$COUNTRY/ways.dat" \
  "$COUNTRY/areanode.idx" \
  "$COUNTRY/areaarea.idx" \
  "$COUNTRY/areaway.idx" \
  "$COUNTRY/areasopt.dat" \
  "$COUNTRY/waysopt.dat" \
  "$COUNTRY/location.idx" \
  "$COUNTRY/water.idx" \
  "$COUNTRY/intersections.dat" \
  "$COUNTRY/intersections.idx" \
  "$COUNTRY/router.dat" \
  "$COUNTRY/router2.dat" \
  "$COUNTRY/router.idx" \
  "$COUNTRY/textloc.dat" \
  "$COUNTRY/textother.dat" \
  "$COUNTRY/textpoi.dat" \
  "$COUNTRY/textregion.dat"


tar -cf "$COUNTRY.debug.tar" \
  "$COUNTRY/location_full.txt" \
  "$COUNTRY/location_region.txt" \
  "$COUNTRY/nodes.idmap" \
  "$COUNTRY/areas.idmap" \
  "$COUNTRY/ways.idmap"


DATE=`date +"%Y%m%d"`
ssh root@home "mkdir -p            /media/web/osmscout/$COUNTRY-$VERSION-$DATE"
scp "$COUNTRY.tar"       root@home:/media/web/osmscout/$COUNTRY-$VERSION-$DATE.tar
scp "$COUNTRY.debug.tar" root@home:/media/web/osmscout/$COUNTRY-$VERSION-$DATE.debug.tar
scp $COUNTRY/*.log       root@home:/media/web/osmscout/$COUNTRY-$VERSION-$DATE/
scp $COUNTRY/*.html      root@home:/media/web/osmscout/$COUNTRY-$VERSION-$DATE/

scp \
  $COUNTRY/*.log \
  $COUNTRY/*.html \
  "$COUNTRY/types.dat" \
  "$COUNTRY/bounding.dat" \
  "$COUNTRY/nodes.dat" \
  "$COUNTRY/areas.dat" \
  "$COUNTRY/ways.dat" \
  "$COUNTRY/areanode.idx" \
  "$COUNTRY/areaarea.idx" \
  "$COUNTRY/areaway.idx" \
  "$COUNTRY/areasopt.dat" \
  "$COUNTRY/waysopt.dat" \
  "$COUNTRY/location.idx" \
  "$COUNTRY/water.idx" \
  "$COUNTRY/intersections.dat" \
  "$COUNTRY/intersections.idx" \
  "$COUNTRY/router.dat" \
  "$COUNTRY/router2.dat" \
  "$COUNTRY/router.idx" \
  "$COUNTRY/textloc.dat" \
  "$COUNTRY/textother.dat" \
  "$COUNTRY/textpoi.dat" \
  "$COUNTRY/textregion.dat" \
  root@home:/media/web/osmscout/$COUNTRY-$VERSION-$DATE/

if [ -f $BASEDIR/secret.sh ] ; then
	source $BASEDIR/secret.sh
	curl -vvv --data "secret=$SECRET" "https://osmscout.karry.cz/addmap.php?&map=$COUNTRY&version=$VERSION&directory=$COUNTRY-$VERSION-$DATE"
else
	echo "can't find secret file!"
fi


rm -rf "/var/btrfs/@maps/$COUNTRY"
rm     "/var/btrfs/@maps/$COUNTRY.tar"
rm     "/var/btrfs/@maps/$COUNTRY.debug.tar"

rm $BASEDIR/$COUNTRY-contours.osm
rm $BASEDIR/$COUNTRY-latest.osm.pbf
