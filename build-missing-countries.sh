#!/bin/bash

# wget http://download.geofabrik.de/asia-latest.osm.pbf
# 
# mkdir -p asia
# 
# cp asia-armenia.poly asia/armenia.poly
# cp asia-bhutan.poly  asia/bhutan.poly
# cp asia-laos.poly    asia/laos.poly
# 
# osmconvert \
#   --verbose \
#   --complex-ways \
#   asia-latest.osm.pbf \
#   -B=asia/armenia.poly \
#   -o=asia/armenia-latest.osm.pbf
# 
# osmconvert \
#   --verbose \
#   --complex-ways \
#   asia-latest.osm.pbf \
#   -B=asia/bhutan.poly \
#   -o=asia/bhutan-latest.osm.pbf
# 
# osmconvert \
#   --verbose \
#   --complex-ways \
#   asia-latest.osm.pbf \
#   -B=asia/laos.poly \
#   -o=asia/laos-latest.osm.pbf
# 
# rm asia-latest.osm.pbf
# 
# export DOWNLOAD=skip
# 
# CONTOURS=1sec ./build.sh asia armenia
# CONTOURS=1sec ./build.sh asia bhutan
# CONTOURS=3sec ./build.sh asia laos

######################################################################
# China subregions, autonomous areas

./download.sh asia china
osmconvert \
  --verbose \
  --complex-ways \
  asia/china-latest.osm.pbf \
  -B=asia/hongkong.poly \
  -o=asia/hongkong-latest.osm.pbf

# osmconvert \
#   --verbose \
#   --complex-ways \
#   asia/china-contours-1sec.osm.pbf \
#   -B=asia/hongkong.poly \
#   -o=asia/hongkong-contours-1sec.osm.pbf
  
rm asia/china-latest.osm.pbf

export DOWNLOAD=skip
CONTOURS=1sec ./build.sh asia hongkong

######################################################################

wget http://download.geofabrik.de/africa-latest.osm.pbf

mkdir -p africa

osmconvert \
  --verbose \
  --complex-ways \
  africa-latest.osm.pbf \
  -B=africa/mayotte.poly \
  -o=africa/mayotte-latest.osm.pbf

rm africa-latest.osm.pbf

export DOWNLOAD=skip
CONTOURS=skip ./build.sh africa mayotte


######################################################################

wget http://download.geofabrik.de/central-america-latest.osm.pbf

osmconvert \
  --verbose \
  --complex-ways \
  central-america-latest.osm.pbf \
  -B=central-america/caribbean-islands.poly \
  -o=central-america/caribbean-islands-latest.osm.pbf

osmconvert \
  --verbose \
  --complex-ways \
  central-america-latest.osm.pbf \
  -B=central-america/bahamas.poly \
  -o=central-america/bahamas-latest.osm.pbf

osmconvert \
  --verbose \
  --complex-ways \
  central-america-latest.osm.pbf \
  -B=central-america/costa-rica.poly \
  -o=central-america/costa-rica-latest.osm.pbf

osmconvert \
  --verbose \
  --complex-ways \
  central-america-latest.osm.pbf \
  -B=central-america/panama.poly \
  -o=central-america/panama-latest.osm.pbf

rm central-america-latest.osm.pbf

export DOWNLOAD=skip
CONTOURS=3sec ./build.sh central-america caribbean-islands
CONTOURS=3sec ./build.sh central-america bahamas
CONTOURS=3sec ./build.sh central-america costa-rica
CONTOURS=3sec ./build.sh central-america panama
