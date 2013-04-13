#!/bin/sh

check_build() {
	BUILD=`find * -name '*i686*.tar.gz' | awk -F/ '{print $1}'`
	PKG=`ls -d vdr-plugin-*`
	for i in $PKG
	do
		FOUND="0"
		for j in $BUILD
		do
			if [ $i == $j ]; then
				FOUND="1"
			fi
		done
		if [ $FOUND == "0" ]; then
			echo "Error : $i"
		fi
	done
}


WORK=$PWD

cd $WORK/vdr-1.7.0

makepkg --asroot -f -c -i -s || return 1

cd $WORK
for i in `ls -d vdr-plugin-*/`
do
	echo "Bulid : $i"
	cd $WORK/$i
	makepkg --asroot -f -c -s || return 1
done

cd $WORK

check_build
