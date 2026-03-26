#!/bin/bash

export CONTOURS=3sec

./build.sh russia central-fed-district
CONTOURS=skip ./build.sh russia far-eastern-fed-district
./build.sh russia north-caucasus-fed-district
./build.sh russia northwestern-fed-district
CONTOURS=skip ./build.sh russia siberian-fed-district
./build.sh russia south-fed-district
./build.sh russia ural-fed-district
./build.sh russia volga-fed-district

./build.sh russia kaliningrad

./gc.sh
