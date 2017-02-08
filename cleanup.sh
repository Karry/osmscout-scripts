#!/bin/bash

if [ $# -lt 2 ] ; then
  echo "Too few arguments"
  exit 1
fi

cd `dirname $0`

CONTINENT=$1
COUNTRY=$2
BASEDIR=$PWD
DATE=`date +"%Y%m%d"`

rm -rf "/var/btrfs/@maps/$CONTINENT-$COUNTRY"
rm     "/var/btrfs/@maps/$CONTINENT-$COUNTRY.tar"
rm     "/var/btrfs/@maps/$CONTINENT-$COUNTRY.debug.tar"

rm $BASEDIR/$CONTINENT/$COUNTRY-contours.osm
rm $BASEDIR/$CONTINENT/$COUNTRY-latest.osm.pbf
