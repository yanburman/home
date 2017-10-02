#!/bin/sh

arg=$1

for c in `git log --format=%H`; do
    output=`git show $c | fgrep -n $arg`
    [ $? -eq 0 ] && echo $c "\n\t" $output "\n\n"
done
