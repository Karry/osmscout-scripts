#!/bin/bash

tmp=`mktemp`
tmpDir=`mktemp -d`
cache="./srtm/SrtmCache"

mkdir -p $cache

cat dem3.lst | while read link ; do
	echo $link
	curl $link > $tmp
	unzip -d "$tmpDir" "$tmp"
	find "$tmpDir" -name \*.hgt -exec mv {} $cache \;
done

echo "rm -rf $tmpDir"
#rm -rf $tmpDir
rm $tmp

