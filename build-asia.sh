#!/bin/bash

export CONTOURS=1sec

CONTOURS=skip ./build.sh asia china
CONTOURS=skip ./build.sh asia india

CONTOURS=3sec ./build.sh asia afghanistan
CONTOURS=3sec ./build.sh asia japan
CONTOURS=3sec ./build.sh asia iran
CONTOURS=3sec ./build.sh asia kyrgyzstan
CONTOURS=3sec ./build.sh asia laos
CONTOURS=3sec ./build.sh asia malaysia-singapore-brunei
CONTOURS=3sec ./build.sh asia mongolia
CONTOURS=3sec ./build.sh asia myanmar
CONTOURS=3sec ./build.sh asia nepal
CONTOURS=3sec ./build.sh asia pakistan
CONTOURS=3sec ./build.sh asia thailand
CONTOURS=3sec ./build.sh asia vietnam
CONTOURS=3sec ./build.sh asia yemen

./build.sh asia azerbaijan
./build.sh asia armenia
./build.sh asia bangladesh
./build.sh asia bhutan
./build.sh asia cambodia
./build.sh asia gcc-states
./build.sh asia indonesia
./build.sh asia iraq
./build.sh asia israel-and-palestine
./build.sh asia jordan
./build.sh asia kazakhstan
./build.sh asia lebanon
./build.sh asia maldives
./build.sh asia north-korea
./build.sh asia philippines
./build.sh asia south-korea
./build.sh asia sri-lanka
./build.sh asia syria
./build.sh asia taiwan
./build.sh asia tajikistan
./build.sh asia turkmenistan
./build.sh asia uzbekistan

./gc.sh
