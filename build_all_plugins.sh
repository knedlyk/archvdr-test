#!/bin/sh

WORK=$PWD
PLUGINS=`ls -l | grep vdr-plugin | awk -F ' ' '{print $9;}'`

rm -f $WORK/build.log

for PLUGIN in $PLUGINS
do
	echo $PLUGIN
	cd $WORK/$PLUGIN
	rm -rf src pkg > /dev/null
	makepkg --asroot -c -f -s
	mv *pkg.tar.gz $WORK/packages > /dev/null
	mv *pkg.tar.xz $WORK/packages > /dev/null
	BUILD=`ls $WORK/packages/$PLUGIN*`
	if [ "$BUILD" == "" ]; then
		echo "build fail for $PLUGIN" >> $WORK/build.log
	fi
done
