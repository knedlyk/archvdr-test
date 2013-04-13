#/bin/sh

rm -rf src pkg

makepkg --asroot -f

if [ -e src ]; then
  rm -rf src
fi
if [ -e vdr-1.7.31 ]; then
  rm -rf vdr-1.7.31
fi
if [ -e vdr-1.7.31-patched ]; then
  rm -rf vdr-1.7.31-patched
fi
cp -r src/vdr-1.7.31 vdr-1.7.31
cp -r src/vdr-1.7.31 vdr-1.7.31-patched
