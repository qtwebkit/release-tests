#!/bin/sh -ex
[ -z "$MAKE" ] && MAKE=make
UNAME=$(uname)

git clone --depth 1 https://github.com/annulen/phantomjs.git
cd phantomjs
qmake
$MAKE -j $HOST_N_CORES
export QT_QPA_PLATFORM=minimal
bin/phantomjs --version
#test/run-tests.py --verbose
cd ..
