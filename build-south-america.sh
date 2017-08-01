#!/bin/bash

mkdir -p south-america

export CONTOURS=3sec-sparse

./build.sh south-america argentina
./build.sh south-america bolivia
./build.sh south-america brazil
./build.sh south-america chile
./build.sh south-america colombia
./build.sh south-america ecuador
CONTOURS=1sec ./build.sh south-america paraguay
CONTOURS=3sec-sparse ./build.sh south-america peru
CONTOURS=1sec ./build.sh south-america suriname
CONTOURS=1sec ./build.sh south-america uruguay
