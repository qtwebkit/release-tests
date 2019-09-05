#!/bin/sh -ex
SIP_VERSION="4.19.18"
SIP_DIRNAME="sip-${SIP_VERSION}"
SIP_ARCHIVE="${SIP_DIRNAME}.tar.gz"

curl --progress-bar -L -OJ https://www.riverbankcomputing.com/static/Downloads/sip/$SIP_VERSION/$SIP_ARCHIVE
tar xf $SIP_ARCHIVE
cd $SIP_DIRNAME
# Install executables to Qt bin dir to avoid $PATH issues
python3 configure.py --bindir=$QTDIR/bin
make -j $HOST_N_CORES
sudo make install
cd ..
