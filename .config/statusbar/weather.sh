#!/bin/sh

perl -e 'print qq{{"version": 1}[}'

while true
do
	# Get output silently, remove unwanted lines, reformat, output to temp file
	curl -s wttr.in?QT0 | perl -nge '/([a-zA-Z]+[a-zA-Z, ]*)?\n.*?(-?\d+)(\(-?\d+\))? °F/; print qq{[{"full_text": "$1 $2$3°F", "markup":"none"}],}'
	sleep 900
done
