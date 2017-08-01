#!/bin/bash

mkdir -p australia-oceania


CONTOURS=skip ./build.sh australia-oceania australia
CONTOURS=1sec ./build.sh australia-oceania fiji
CONTOURS=1sec ./build.sh australia-oceania new-caledonia
CONTOURS=3sec ./build.sh australia-oceania new-zealand
