#!/bin/sh

. /etc/vdr/vdr-addon-tomkv.conf

usage () {
  echo "Usage : tomkv.sh indir outfile"
  logger tomkv "Usage : tomkv.sh indir outfile"
  exit 0
}

TITLE=`grep ^"T " $1/info | sed -e 's/ /_/g' -e 's/^T_//g'`.mkv

if [ ! -e $VIDEODIR ]; then
  exit 0
fi

if [ "$1" == "" ]; then
  usage
fi

logger tomkv "INDIR : $1"
logger tomkv "VIDEODIR : $1"
logger tomkv "OUTFILE : $TITLE"

logger tomkv "cat $1/*.ts | ffmpeg -y -i - -vcodec copy -sameq -acodec copy -vsync 2 -async 2 -f matroska $VIDEODIR/$TITLE"
cat $1/*.ts | ffmpeg -y -i - -vcodec copy -qscale 0 -acodec copy -vsync 2 -async 2 -f matroska $VIDEODIR/$TITLE &
