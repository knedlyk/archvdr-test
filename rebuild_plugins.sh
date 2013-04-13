#!/bin/sh

PLUGINS=`pacman -Q | grep vdr-plugin | awk -F ' ' '{print $1;}'`

WORK=$PWD

mkdir $WORK/packages

for i in $PLUGINS
do
	echo $i
	cd $WORK/$i
	rm -rf pkg src *pkg.tar.gz *pkg.tar.xz
	makepkg --asroot -f -c -s || return 1
	mv *pkg.tar.gz $WORK/packages
	mv *pkg.tar.xz $WORK/packages
	rm -rf pkg src
done

