#/bin/sh

rm -rf src pkg

makepkg --asroot -f

if [ -e vdr-1.7.27 ]; then
  rm -rf vdr-1.7.27
fi
if [ -e vdr-1.7.27-patched ]; then
  rm -rf vdr-1.7.27-patched
fi
cp -r src/vdr-1.7.27 vdr-1.7.27
cp -r src/vdr-1.7.27 vdr-1.7.27-patched
