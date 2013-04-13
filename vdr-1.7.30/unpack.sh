#/bin/sh

rm -rf src pkg

makepkg --asroot -f

if [ -e src ]; then
  rm -rf src
fi
if [ -e vdr-1.7.30 ]; then
  rm -rf vdr-1.7.30
fi
if [ -e vdr-1.7.30-patched ]; then
  rm -rf vdr-1.7.30-patched
fi
cp -r src/vdr-1.7.30 vdr-1.7.30
cp -r src/vdr-1.7.30 vdr-1.7.30-patched
