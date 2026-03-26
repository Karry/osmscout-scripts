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

mkdir -p europe/france

./build.sh europe/france alsace
./build.sh europe/france aquitaine
./build.sh europe/france auvergne
./build.sh europe/france basse-normandie
./build.sh europe/france bourgogne
./build.sh europe/france bretagne
./build.sh europe/france centre
./build.sh europe/france champagne-ardenne
./build.sh europe/france corse
./build.sh europe/france franche-comte

CLEANUP=skip ./build.sh europe/france guadeloupe
mv /var/btrfs/@maps/europe/france-guadeloupe /var/btrfs/@maps/central-america-guadeloupe
./upload.sh  central-america guadeloupe
./cleanup.sh central-america guadeloupe

CLEANUP=skip ./build.sh europe/france guyane
mv /var/btrfs/@maps/europe/france-guyane /var/btrfs/@maps/south-america-guyane
./upload.sh  south-america guyane
./cleanup.sh south-america guyane

./build.sh europe/france haute-normandie
./build.sh europe/france ile-de-france
./build.sh europe/france languedoc-roussillon
./build.sh europe/france limousin
./build.sh europe/france lorraine

CLEANUP=skip ./build.sh europe/france martinique
mv /var/btrfs/@maps/europe/france-martinique /var/btrfs/@maps/central-america-martinique
./upload.sh  central-america martinique
./cleanup.sh central-america martinique

CLEANUP=skip ./build.sh europe/france mayotte
mv /var/btrfs/@maps/europe/france-mayotte /var/btrfs/@maps/africa-mayotte
./upload.sh  africa mayotte
./cleanup.sh africa mayotte

./build.sh europe/france midi-pyrenees
./build.sh europe/france nord-pas-de-calais
./build.sh europe/france pays-de-la-loire
./build.sh europe/france picardie
./build.sh europe/france poitou-charentes
./build.sh europe/france provence-alpes-cote-d-azur

CLEANUP=skip ./build.sh europe/france reunion
mv /var/btrfs/@maps/europe/france-reunion /var/btrfs/@maps/africa-reunion
./upload.sh  africa reunion
./cleanup.sh africa reunion

./build.sh europe/france rhone-alpes

./gc.sh
