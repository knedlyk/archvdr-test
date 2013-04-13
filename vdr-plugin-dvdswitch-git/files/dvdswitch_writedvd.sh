#!/bin/sh
#
# This script will by called by the vdr-plugin-dvdswitch to
# write a dvd iso image or a dvd file structure.
#
# It gets the following parameter:
#
# $1 = filename of the iso file
#
######################################

SVDRPSEND=/usr/lib/vdr/svdrpsend.pl
DVDWRITER=/dev/dvd

######################################

cleanup()
{
    $SVDRPSEND mesg "$1"
    logger -t writedvd.sh "$1"
    logger -t writedvd.sh < $CHECKFILE
    rm -f $CHECKFILE
    eject $DVDWRITER
    exit 0
}

isminusrw()
{
    MEDIA="`grep "^ Mounted Media" $CHECKFILE | cut -d" " -f13`"
    [ -z $MEDIA ] && cleanup
    [ "$MEDIA" = "DVD-RW" ] && return 0 || return 1 
}

isplusrw()
{
    MEDIA="`grep "^ Mounted Media" $CHECKFILE | cut -d" " -f13`"
    [ -z $MEDIA ] && cleanup
    [ "$MEDIA" = "DVD+RW" ] && return 0 || return 1
}
  

dvd_isempty()
{
    USED="`grep "^ Disc status" $CHECKFILE | cut -d":" -f2 | sed -e ' s/ //g'`"
    case $USED in
        blank|appendable)
            return 0
        ;;

        *)
            return 1
        ;;
    esac
} 

have_media()
{
    [ -z "`grep \"^:-( no media\" $CHECKFILE`" ] && return 0 || return 1
}

### start skript
# close if the drive is open
eject -t $DVDWRITER

# check drive content
CHECKFILE=`mktemp`
dvd+rw-mediainfo $DVDWRITER &> $CHECKFILE

if ! have_media ; then 
    cleanup "No Media found."
fi

if ! dvd_isempty ; then 
    if isminusrw ; then
        # only DVD-RW need to be formated again, DVD+RW can get just overwritten 
        echo " ( dvd+rw-format $DVDWRITER -force ) " | at now
    else 
        if ! isplusrw ; then 
            cleanup  "Media full. Insert empty media."
        fi
    fi
fi

if [ -d "$1" ]; then 
    NAME="`basename \"$1\"`"
    # write dvd structure
    echo "while [ \"`pgrep -o dvd.rw`\" ] ;do sleep 2; done && growisofs -use-the-force-luke=tty -dvd-compat -Z $DVDWRITER -dvd-video -V \"$NAME\" \"$1\" && eject " | at now
else
    if [ -f "$1" ]; then 
        # write dvd image
        echo "while [ \"`pgrep -o dvd.rw`\" ] ;do sleep 2; done && growisofs -dvd-compat -use-the-force-luke=tty -Z $DVDWRITER=\"$1\" && eject " | at now
    else
        cleanup "File: \"$1\" not found."       
    fi
fi


# all was successfull so far
$SVDRPSEND mesg  "Start writing to media."
rm -f $CHECKFILE
