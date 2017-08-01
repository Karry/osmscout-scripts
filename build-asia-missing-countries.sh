#!/bin/bash

wget http://download.geofabrik.de/asia-latest.osm.pbf

mkdir -p asia

cp asia-armenia.poly asia/armenia.poly
cp asia-bhutan.poly  asia/bhutan.poly
cp asia-laos.poly    asia/laos.poly

osmconvert \
  --verbose \
  --complex-ways \
  asia-latest.osm.pbf \
  -B=asia/armenia.poly \
  -o=asia/armenia-latest.osm.pbf

osmconvert \
  --verbose \
  --complex-ways \
  asia-latest.osm.pbf \
  -B=asia/bhutan.poly \
  -o=asia/bhutan-latest.osm.pbf

osmconvert \
  --verbose \
  --complex-ways \
  asia-latest.osm.pbf \
  -B=asia/laos.poly \
  -o=asia/laos-latest.osm.pbf

rm asia-latest.osm.pbf

export DOWNLOAD=skip

CONTOURS=1sec ./build.sh asia armenia
CONTOURS=1sec ./build.sh asia bhutan
CONTOURS=3sec ./build.sh asia laos

