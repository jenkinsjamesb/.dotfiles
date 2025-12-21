#!/bin/sh

perl -e 'print qq{{"version": 1}[}'

while true
do
	# Get output silently, remove unwanted lines, reformat, output to temp file
	cat numlock | perl -nge '/(on|off)/; print qq{[{"full_text": "NUM $1", "markup":"none"}],}'
	sleep 1
done
