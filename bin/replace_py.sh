#!/bin/sh

if [ "$#" -ne 2 ]; then
	echo "usage: $0 <from> <to>"
	exit 1
fi

FROM=$1
TO=$2

find . -name "*.py" | xargs  sed -i "s/${FROM}/${TO}/g"
