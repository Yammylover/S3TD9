#!/bin/bash
if [ $# -ne 1 ] ;then	#-ne/!=
	echo "pas ou trop d'arguments"
	exit 6
fi

root_dir=$1

if ! [ -d "$root_dir" ] ;then
	echo "pas un dossier"
	exit 5
fi 

files=`ls "$root_dir"` #files=$(ls "root_dir")
#printf "$i1"
#echo $1
for filename in $files
do
	filepath="$root_dir/$filename"
	if [ -x "$filepath" ]; then	#la vérification -x a lieu dans le dossier parent par défaut
		size=$(du -b "$filepath" | cut -f1)
		echo "$filename: $size bytes"
	fi
done
