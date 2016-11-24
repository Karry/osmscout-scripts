#!/bin/bash

mkdir -p north-america/us

export CONTOURS=skip

./build.sh north-america canada
./build.sh north-america greenland
./build.sh north-america mexico

./build.sh north-america/us alaska
export CONTOURS=yes
./build.sh north-america/us alabama
./build.sh north-america/us arizona
./build.sh north-america/us arkansas
./build.sh north-america/us california
./build.sh north-america/us colorado
./build.sh north-america/us connecticut
./build.sh north-america/us delaware
./build.sh north-america/us district-of-columbia
./build.sh north-america/us florida
./build.sh north-america/us georgia
./build.sh north-america/us hawaii
./build.sh north-america/us idaho
./build.sh north-america/us illinois
./build.sh north-america/us indiana
./build.sh north-america/us iowa
./build.sh north-america/us kansas
./build.sh north-america/us kentucky
./build.sh north-america/us louisiana
./build.sh north-america/us maine
./build.sh north-america/us maryland
./build.sh north-america/us massachusetts
./build.sh north-america/us michigan
./build.sh north-america/us minnesota
./build.sh north-america/us mississippi
./build.sh north-america/us missouri
./build.sh north-america/us montana
./build.sh north-america/us nebraska
./build.sh north-america/us nevada
./build.sh north-america/us new-hampshire
./build.sh north-america/us new-jersey
./build.sh north-america/us new-mexico
./build.sh north-america/us new-york
./build.sh north-america/us north-carolina
./build.sh north-america/us north-dakota
./build.sh north-america/us ohio
./build.sh north-america/us oklahoma
./build.sh north-america/us oregon
./build.sh north-america/us pennsylvania
./build.sh north-america/us rhode-island
./build.sh north-america/us south-carolina
./build.sh north-america/us south-dakota
./build.sh north-america/us tennessee
./build.sh north-america/us texas
./build.sh north-america/us utah
./build.sh north-america/us vermont
./build.sh north-america/us virginia
./build.sh north-america/us washington
./build.sh north-america/us west-virginia
./build.sh north-america/us wisconsin
./build.sh north-america/us wyoming

./build.sh north-america us-midwest
./build.sh north-america us-northeast
export CONTOURS=skip
./build.sh north-america us-pacific
export CONTOURS=yes
#./prepare-contour-large.sh north-america us-south
./build.sh north-america us-south
#./prepare-contour-large.sh north-america us-west
./build.sh north-america us-west
