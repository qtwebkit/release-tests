#!/bin/sh -ex
ARCHIVE="$1"

find $QTDIR -name '*.debug' -exec rm {} \;
find $QTDIR -name '*.a' -exec rm {} \;
find $QTDIR -name '*.la' -exec rm {} \;
find $QTDIR -name '*.prl' -exec rm {} \;
find $QTDIR -name '*.lib' -exec rm {} \;
find $QTDIR -name '*d.dll' -exec rm {} \;
find $QTDIR -name '*.pdb' -exec rm {} \;
rm -rf $QTDIR/include
rm -rf $QTDIR/doc
rm -rf $QTDIR/mkspecs
rm -rf $QTDIR/lib/cmake
rm -rf $QTDIR/lib/pkgconfig
7z a -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on $ARCHIVE $QTDIR
