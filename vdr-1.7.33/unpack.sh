#/bin/sh

rm -rf src pkg

makepkg --asroot -f

if [ -e vdr-1.7.33 ]; then
  rm -rf vdr-1.7.33
fi
if [ -e vdr-1.7.33-patched ]; then
  rm -rf vdr-1.7.33-patched
fi
cp -r src/vdr-1.7.33 vdr-1.7.33
cp -r src/vdr-1.7.33 vdr-1.7.33-patched
