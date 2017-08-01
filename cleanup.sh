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

rm $BASEDIR/$CONTINENT/$COUNTRY-latest.osm.pbf
