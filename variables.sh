#!/bin/bash

CONTINENT=$1
COUNTRY=$2
BASEDIR=$PWD
VERSION=10
DATE=`date +"%Y%m%d"`

echo "export CONTINENT=$CONTINENT"
echo "export COUNTRY=$COUNTRY"
echo "export BASEDIR=$BASEDIR"
echo "export VERSION=$VERSION"
echo "export DATE=$DATE"

echo "cd /var/btrfs/@maps/"

