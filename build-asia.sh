#!/bin/bash

export CONTOURS=yes

./build.sh asia afghanistan
./build.sh asia azerbaijan
./build.sh asia bangladesh
./build.sh asia cambodia

./build.sh asia gcc-states
export CONTOURS=skip
./build.sh asia china
./build.sh asia india
./build.sh asia indonesia
./build.sh asia japan
export CONTOURS=yes

./build.sh asia iran
./build.sh asia iraq
./build.sh asia israel-and-palestine
./build.sh asia jordan
./build.sh asia kazakhstan
./build.sh asia kyrgyzstan
./build.sh asia lebanon
./build.sh asia malaysia-singapore-brunei
./build.sh asia maldives
./build.sh asia mongolia
./build.sh asia myanmar
./build.sh asia nepal
./build.sh asia north-korea
./build.sh asia pakistan
./build.sh asia philippines
./build.sh asia south-korea
./build.sh asia sri-lanka
./build.sh asia syria
./build.sh asia taiwan
./build.sh asia tajikistan
./build.sh asia thailand
./build.sh asia turkmenistan
./build.sh asia uzbekistan
./build.sh asia vietnam
./build.sh asia yemen
