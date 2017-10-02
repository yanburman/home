#!/bin/sh

for pid in `ps -A -ostat,ppid | awk '/[zZ]/{ print $2 }'`; do
	[ $pid -ne 1 ] && kill -9 $pid
done

