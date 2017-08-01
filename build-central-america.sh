#!/bin/bash

mkdir -p central-america

export CONTOURS=3sec
# export CONTOURS=skip

./build.sh central-america belize
./build.sh central-america cuba
./build.sh central-america guatemala
./build.sh central-america haiti-and-domrep
./build.sh central-america nicaragua
