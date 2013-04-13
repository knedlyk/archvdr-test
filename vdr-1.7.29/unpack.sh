#/bin/sh

rm -rf src pkg

makepkg --asroot -f

if [ -e src ]; then
  rm -rf src
fi
if [ -e vdr-1.7.29 ]; then
  rm -rf vdr-1.7.29
fi
if [ -e vdr-1.7.29-patched ]; then
  rm -rf vdr-1.7.29-patched
fi
cp -r src/vdr-1.7.29 vdr-1.7.29
cp -r src/vdr-1.7.29 vdr-1.7.29-patched
