#!/bin/sh

if [ "$#" -ne 2 ]; then
	echo "usage: $0 <from> <to>"
	exit 1
fi

FROM=$1
TO=$2

find . -name "*.c" -o -name "*.cc" -o -name "*.h" -o -name "*.hh" -o -name CMakeLists.txt -o -name "*.py" | xargs  sed -i "s/${FROM}/${TO}/g"
