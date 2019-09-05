#!/bin/sh -ex
git clone --depth 1 https://github.com/OtterBrowser/otter-browser.git
mkdir otter-browser-build
cmake -Botter-browser-build -Hotter-browser -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$QTDIR $CMAKE_ARGS -G "$CMAKE_GENERATOR"
cmake --build otter-browser-build --config Release -j $HOST_N_CORES
