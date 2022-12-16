#!/bin/bash

ICON=$1
FILENAME=$2
COLOR=$3

if [ "$1" == "help" ]; then
    echo "./gen.sh ICON FILENAME COLOR (optional, default 'pink')"
    echo "./gen.sh --list to list all icons"
    exit
fi

if [ "$1" == "--list" ]; then
    for file in ./feather/*; do
      echo "${file##*/}"
    done
    exit
fi

if [ -z "$ICON" ]; then
    echo "Icon name is required"
    exit
fi

if [ -z "$FILENAME" ]; then
    echo "Filename is required"
    exit;
fi

if [ -z "$COLOR" ]; then
    COLOR=pink
fi

convert -gravity center ./backgrounds/$COLOR.png ./feather/$ICON.png -composite -resize 500x500 output/$FILENAME.png