#!/bin/bash

mkdir -p australia-oceania


CONTOURS=skip ./build.sh australia-oceania australia
CONTOURS=1sec ./build.sh australia-oceania fiji
CONTOURS=1sec ./build.sh australia-oceania new-caledonia
CONTOURS=3sec ./build.sh australia-oceania new-zealand

CONTOURS=3sec ./build.sh australia-oceania american-oceania
CONTOURS=3sec ./build.sh australia-oceania cook-islands
CONTOURS=3sec ./build.sh australia-oceania ile-de-clipperton
CONTOURS=3sec ./build.sh australia-oceania kiribati
CONTOURS=3sec ./build.sh australia-oceania marshall-islands
CONTOURS=3sec ./build.sh australia-oceania micronesia
CONTOURS=3sec ./build.sh australia-oceania nauru
CONTOURS=3sec ./build.sh australia-oceania niue
CONTOURS=3sec ./build.sh australia-oceania palau
CONTOURS=3sec ./build.sh australia-oceania papua-new-guinea
CONTOURS=3sec ./build.sh australia-oceania pitcairn-islands
CONTOURS=3sec ./build.sh australia-oceania polynesie-francaise
CONTOURS=3sec ./build.sh australia-oceania samoa
CONTOURS=3sec ./build.sh australia-oceania solomon-islands
CONTOURS=3sec ./build.sh australia-oceania tokelau
CONTOURS=3sec ./build.sh australia-oceania tonga
CONTOURS=3sec ./build.sh australia-oceania tuvalu
CONTOURS=3sec ./build.sh australia-oceania vanuatu
CONTOURS=3sec ./build.sh australia-oceania wallis-et-futuna


./gc.sh
