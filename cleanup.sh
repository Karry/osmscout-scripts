#!/bin/bash

cd `dirname $0`

CONTINENT=$1
COUNTRY=$2
BASEDIR=$PWD
VERSION=10
DATE=`date +"%Y%m%d"`

rm -rf "/var/btrfs/@maps/$CONTINENT-$COUNTRY"
rm     "/var/btrfs/@maps/$CONTINENT-$COUNTRY.tar"
rm     "/var/btrfs/@maps/$CONTINENT-$COUNTRY.debug.tar"

rm $BASEDIR/$CONTINENT/$COUNTRY-contours.osm
rm $BASEDIR/$CONTINENT/$COUNTRY-latest.osm.pbf
