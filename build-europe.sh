#!/bin/bash
export CONTOURS=1sec

./build.sh europe albania
./build.sh europe andorra
./build.sh europe austria
./build.sh europe azores
./build.sh europe belarus
./build.sh europe belgium
./build.sh europe bosnia-herzegovina
./build.sh europe bulgaria
./build.sh europe croatia
./build.sh europe cyprus
./build.sh europe czech-republic
./build.sh europe denmark
./build.sh europe estonia
./build.sh europe faroe-islands
./build.sh europe finland
CONTOURS=3sec ./build.sh europe france
./build.sh europe georgia
./build.sh europe germany
./build.sh europe great-britain
./build.sh europe greece
./build.sh europe hungary
./build.sh europe iceland
./build.sh europe ireland-and-northern-ireland
./build.sh europe isle-of-man
CONTOURS=3sec ./build.sh europe italy
./build.sh europe kosovo
./build.sh europe latvia
./build.sh europe liechtenstein
./build.sh europe lithuania
./build.sh europe luxembourg
./build.sh europe macedonia
./build.sh europe malta
./build.sh europe moldova
./build.sh europe monaco
./build.sh europe montenegro
./build.sh europe netherlands
CONTOURS=3sec ./build.sh europe norway
./build.sh europe poland
./build.sh europe portugal
./build.sh europe romania
./build.sh europe serbia
./build.sh europe slovakia
./build.sh europe slovenia
CONTOURS=3sec ./build.sh europe spain
./build.sh europe sweden
./build.sh europe switzerland
CONTOURS=3sec ./build.sh europe turkey
./build.sh europe ukraine

CONTOURS=3sec ./build.sh europe alps
./build.sh europe britain-and-ireland
CONTOURS=3sec ./build.sh europe dach

mkdir -p europe/germany
./build.sh europe/germany baden-wuerttemberg
./build.sh europe/germany bayern
./build.sh europe/germany brandenburg
./build.sh europe/germany bremen
./build.sh europe/germany hamburg
./build.sh europe/germany hessen
./build.sh europe/germany mecklenburg-vorpommern
./build.sh europe/germany niedersachsen
./build.sh europe/germany nordrhein-westfalen
./build.sh europe/germany rheinland-pfalz
./build.sh europe/germany saarland
./build.sh europe/germany sachsen
./build.sh europe/germany sachsen-anhalt
./build.sh europe/germany schleswig-holstein
./build.sh europe/germany thueringen

./gc.sh
