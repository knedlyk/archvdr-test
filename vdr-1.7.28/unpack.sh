#/bin/sh

rm -rf src pkg

makepkg --asroot -f

if [ -e vdr-1.7.28 ]; then
  rm -rf vdr-1.7.28
fi
if [ -e vdr-1.7.28-patched ]; then
  rm -rf vdr-1.7.28-patched
fi
cp -r src/vdr-1.7.28 vdr-1.7.28
cp -r src/vdr-1.7.28 vdr-1.7.28-patched
