#!/bin/bash

#Is file path provided
if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <directory-path>"
	exit 1
fi

#input path
DIR_PATH="$1"

echo "Converted path: $DIR_PATH"

#is valid directory
if [ ! -d "$DIR_PATH" ]; then
	echo "Not a valid path"
	exit 1
fi

#find all files in directory 
find "$DIR_PATH" -type f | while read -r file; do
	#compute SHA-256 hash
	hash=$(sha256sum "$file" | awk '{print $1}')
	#print file and hash
	echo "$file: $hash"
done
