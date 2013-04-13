#!/bin/sh

usage()
{
    echo "usage: test-vdr-systeminfo.sh [/path/to/systeminfo.sh]"
    exit
}

if [ -n "$1" ]; then
    FILE="$1"
else
    FILE="/etc/vdr/plugins/systeminfo.sh"
fi

if [ ! -e "$FILE" ]; then
    echo "error: $FILE does not exist"
    usage
fi

if [ ! -x "$FILE" ]; then
    echo "error: $FILE is not executable"
    usage
fi
    
for i in $(seq 1 50); do
    OUTPUT=$(eval "$FILE $i")
    [ -n "$OUTPUT" ] && echo "$OUTPUT"
done

echo
