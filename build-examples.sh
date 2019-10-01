#!/bin/sh -ex
[ -z "$MAKE" ] && MAKE=make

git clone --depth 1 -b no_example_installs https://github.com/annulen/qtwebkit-examples.git
cd qtwebkit-examples/examples
qmake
$MAKE -j $HOST_N_CORES
$MAKE install
cd ../..
