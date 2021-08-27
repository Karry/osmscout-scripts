#!/bin/bash

BASEDIR=$(dirname $0)

if [ -f $BASEDIR/secret.sh ] ; then
	source $BASEDIR/secret.sh
	curl -vvv \
    --data "secret=$SECRET" \
    "https://osmscout.karry.cz/cleanup.php"  || exit 1
else
	echo "can't find secret file!"
	exit 1
fi

