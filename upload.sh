#!/bin/bash

set -xe 

if [ $# -lt 2 ] ; then
  echo "Too few arguments"
  exit 1
fi

cd `dirname $0`

CONTINENT=$1
COUNTRY=$2
BASEDIR=$PWD
VERSION=`OSMScoutImport --data-version`
DATE=`date +"%Y%m%d-%H%M"`

cd /var/btrfs/@maps/

ssh root@home "mkdir -p            /media/web/osmscout/$CONTINENT/$COUNTRY-$VERSION-$DATE"  || exit 1

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
  "$CONTINENT-$COUNTRY/textloc.dat" \
  "$CONTINENT-$COUNTRY/textother.dat" \
  "$CONTINENT-$COUNTRY/textpoi.dat" \
  "$CONTINENT-$COUNTRY/textregion.dat" \
  "$CONTINENT-$COUNTRY/location_full.txt" \
  "$CONTINENT-$COUNTRY/location_region.txt" \
  "$CONTINENT-$COUNTRY/nodes.idmap" \
  "$CONTINENT-$COUNTRY/areas.idmap" \
  "$CONTINENT-$COUNTRY/ways.idmap" \
  "$CONTINENT-$COUNTRY/coverage.idx" \
  root@home:/media/web/osmscout/$CONTINENT/$COUNTRY-$VERSION-$DATE/ || exit 1

if [ -f $BASEDIR/secret.sh ] ; then
	source $BASEDIR/secret.sh
	curl -vvv \
    --data "secret=$SECRET" \
    "https://osmscout.karry.cz/addmap.php?map=$CONTINENT/$COUNTRY&version=$VERSION&directory=$CONTINENT/$COUNTRY-$VERSION-$DATE"  || exit 1
else
	echo "can't find secret file!"
	exit 1
fi

