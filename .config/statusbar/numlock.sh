#!/bin/sh

state=$(<$(dirname "$0")/numlock)

#echo $state

if [ $state = "on" ]; then
  echo "off" > $(dirname "$0")/numlock
else
  echo "on" > $(dirname "$0")/numlock
fi
