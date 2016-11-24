#!/bin/bash

mkdir -p australia-oceania

# export CONTOURS=yes
export CONTOURS=skip

./build.sh australia-oceania australia
./build.sh australia-oceania fiji
./build.sh australia-oceania new-caledonia
./build.sh australia-oceania new-zealand
