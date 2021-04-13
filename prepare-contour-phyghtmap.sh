#!/bin/bash

if [ $# -lt 2 ] ; then
	echo "No continent / country specified"
	exit 1
fi
if [[ ( "$CONTOURS" != "1sec" ) && ( "$CONTOURS" != "1sec-sparse" ) && ( "$CONTOURS" != "3sec" ) && ( "$CONTOURS" != "3sec-sparse" ) ]] ; then
	echo "Unknown CONTOURS $CONTOURS"
	exit 1
fi

CONTINENT=$1
COUNTRY=$2

RESOLUTION=1
STEP=20
CAT=400,100
if [[ ( "$CONTOURS" = "sparse" ) || ( "$CONTOURS" = "3sec-sparse" ) ]] ; then
  STEP=100
  CAT=1000,500
fi
if [[ ( "$CONTOURS" = "3sec" ) || ( "$CONTOURS" = "3sec-sparse" ) ]] ; then
  RESOLUTION=3
fi

mkdir -p tmp
phyghtmap \
  --no-zero-contour --step=$STEP --line-cat=$CAT \
  --max-nodes-per-tile=0 \
  --max-nodes-per-way=300 \
  --start-node-id=$(( 1 << 48 )) --start-way-id=$(( 1 << 48 )) \
  --srtm=$RESOLUTION --srtm-version=3 --viewfinder-mask=$RESOLUTION \
  --source=view$RESOLUTION,srtm$RESOLUTION --void-range-max=-500 \
  --earthexplorer-user="username" --earthexplorer-password="******" \
  --polygon=$CONTINENT/$COUNTRY.poly --output-prefix=tmp/$CONTINENT-$COUNTRY || exit 1

#  --pbf --polygon=europe/czech-republic.poly --output-prefix=tmp/tiles

osmconvert \
  --verbose --statistics \
  tmp/$CONTINENT-$COUNTRY*.osm \
  -B=$CONTINENT/$COUNTRY.poly \
  -o=$CONTINENT/$COUNTRY-contours-$CONTOURS.osm.pbf || exit 1

rm tmp/$CONTINENT-$COUNTRY*.osm
