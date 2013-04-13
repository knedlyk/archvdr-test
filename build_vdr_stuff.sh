#!/bin/sh

WORK=$PWD
#PLUGINS=`ls -l | grep vdr-plugin | awk -F ' ' '{print $9;}'`
PLUGINS=`pacman -Q | grep vdr-plugin | awk -F ' ' '{print $1;}'`


rm -Rf $WORK/build.log $WORK/packages/
mkdir $WORK/packages/

#cd $WORK/../..
#sudo -u vdr svn update
#cd $WORK

# build vdr
#VDR=`ls -l | grep vdr-1.7 | awk -F ' ' '{print $9;}' | tail -n 1`
VDR=`ls -l | grep vdr-2. | awk -F ' ' '{print $9;}' | tail -n 1`

#VDR=vdr-1.7.29
echo $VDR
cd $WORK/$VDR
rm -rf src pkg  > /dev/null
makepkg --asroot -c -f -s
mv *pkg.tar.xz $WORK/packages/ > /dev/null
BUILD=`ls $WORK/packages/$vdr*`
if [ "$BUILD" == "" ]; then
    echo "build fail for $VDR" >> $WORK/build.log
fi
pacman -U --noconfirm $WORK/packages/vdr-2.*.pkg.tar.xz


#build x11 libs
#PKG=libx11-vdr
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
#makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi
#pacman -U $WORK/packages/$PKG*.pkg.tar.xz

#PKG=libbluray
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
#makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi
#pacman -U --noconfirm $WORK/packages/$PKG*.pkg.tar.xz


#PKG=libva-git
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
#makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi
#pacman -U --noconfirm $WORK/packages/$PKG*.pkg.tar.xz



#PKG=xcb-proto
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
#makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi
#pacman -U --noconfirm $WORK/packages/$PKG*.pkg.tar.xz


#PKG=libaacs
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
#makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi
#pacman -U --noconfirm $WORK/packages/$PKG*.pkg.tar.xz


#PKG=libcec
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
#makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi
#pacman -U --noconfirm $WORK/packages/$PKG*.pkg.tar.xz


#PKG=libnfs
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
#makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi
#pacman -U --noconfirm $WORK/packages/$PKG*.pkg.tar.xz


#PKG=libxcb
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
#makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi
#pacman -U --noconfirm $WORK/packages/$PKG*.pkg.tar.xz


#PKG=ffmpeg-git
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
#makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi
#pacman -U --noconfirm $WORK/packages/$PKG*.pkg.tar.xz




##build xine libs
#PKG=xine-lib-1.2
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
##sed -e  's/libx11-vdr/libx11/' -i PKGBUILD
##sed -e  's/--enable-vdpau/--disable-vdpau/' -i PKGBUILD
#LANG=C makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi
##sed -e  's/libx11/libx11-vdr/' -i PKGBUILD
##sed -e  's/--disable-vdpau/--enable-vdpau/' -i PKGBUILD
#pacman -U --noconfirm $WORK/packages/$PKG*.pkg.tar.xz


#yaourt -Sf --noconfirm xine-lib-1.2-vdr-hg


##build xine-ui-hg
#PKG=xine-ui-hg
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
#LANG=C makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi
#pacman -U --noconfirm $WORK/packages/$PKG*.pkg.tar.xz


#build libbluray

#yaourt -S libbluray-git


PKG=ttf-vdrsymbols
cd $WORK/$PKG
rm -rf src pkg *.pkg.tar.xz > /dev/null
makepkg --asroot -c -f -s
mv *pkg.tar.xz $WORK/packages/ > /dev/null
BUILD=`ls $WORK/packages/$PKG*`
if [ "$BUILD" == "" ]; then
    echo "build fail for $PKG" >> $WORK/build.log
fi
pacman -U --noconfirm $WORK/packages/ttf-vdrsymbols*.pkg.tar.xz


##build vdr-scripts
#PKG=vdr-scripts
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
#makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi
#pacman -U --noconfirm $WORK/packages/vdr-scripts*.pkg.tar.xz


#build crystalhd and crystalhd-lib
#PKG=crystalhd
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
#makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG-2010*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi
#pacman -U --noconfirm $WORK/packages/crystalhd*.pkg.tar.xz

#PKG=crystalhd-lib
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
#makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi
#pacman -U --noconfirm $WORK/packages/crystalhd-lib*.pkg.tar.xz

#PKG=cxxtools
#cd $WORK/$PKG
#rm -rf src pkg *.pkg.tar.xz > /dev/null
#makepkg --asroot -c -f -s
#mv *pkg.tar.xz $WORK/packages/ > /dev/null
#BUILD=`ls $WORK/packages/$PKG*`
#if [ "$BUILD" == "" ]; then
#    echo "build fail for $PKG" >> $WORK/build.log
#fi


#cd $WORK/vdr-plugin-rssreader/
#sed -i -e "s/etc\/vdr\/plugins\/rssreader.conf/etc\/vdr\/plugins\/rssreader\/rssreader.conf/" $WORK/vdr-plugin-rssreader/PKGBUILD




# build vdr plugins
for PLUGIN in $PLUGINS
do
	echo $PLUGIN
	cd $WORK/$PLUGIN
	rm -rf src pkg *.pkg.tar.xz > /dev/null
	makepkg --asroot -c -f -s
	mv *pkg.tar.xz $WORK/packages/ > /dev/null
	BUILD=`ls $WORK/packages/$PLUGIN*`
	if [ "$BUILD" == "" ]; then
		echo "build fail for $PLUGIN" >> $WORK/build.log
	fi
done

pacman -U --noconfirm $WORK/packages/*-plugin*.pkg.tar.xz

#repo-add $WORK/packages/vdr.db.tar.gz $WORK/packages/*.pkg.tar.*
