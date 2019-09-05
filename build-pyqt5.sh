#!/bin/sh -ex

./build-sip.sh

PyQt5_VERSION="5.13.0"
PyQt5_DIRNAME="PyQt5_gpl-${PyQt5_VERSION}"
PyQt5_ARCHIVE="${PyQt5_DIRNAME}.tar.gz"

curl --progress-bar -L -OJ https://www.riverbankcomputing.com/static/Downloads/PyQt5/$PyQt5_VERSION/$PyQt5_ARCHIVE
tar xf $PyQt5_ARCHIVE
cd $PyQt5_DIRNAME
# Use --concatenate to speed up build
# Install executables to Qt bin dir to avoid $PATH issues
# Disable modules which are not used in qutebrowser
python3 configure.py --qmake $(which qmake) --bindir=$QTDIR/bin --confirm-license --concatenate \
    --no-designer-plugin \
    --disable=QtMultimedia \
    --disable=QtMultimediaWidgets \
    --disable=QtXml \
    --disable=QtDBus \
    --disable=QtSensors \
    --disable=QtSvg \
    --disable=QtPositioning \
    --disable=QtWebChannel \
    --disable=QtLocation
make -j $HOST_N_CORES
sudo make install
cd ..
