#/bin/sh

rm -rf src pkg

makepkg --asroot -f

if [ -e vdr-2.0.0 ]; then
  rm -rf vdr-2.0.0
fi
if [ -e vdr-2.0.0-patched ]; then
  rm -rf vdr-2.0.0-patched
fi
cp -r src/vdr-2.0.0 vdr-2.0.0
cp -r src/vdr-2.0.0 vdr-2.0.0-patched
