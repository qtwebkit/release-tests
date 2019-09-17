#!/bin/bash -ex
git clone --depth 1 https://github.com/OtterBrowser/otter-browser.git
mkdir otter-browser-build
cmake -Botter-browser-build -Hotter-browser -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$QTDIR $CMAKE_ARGS -G "$CMAKE_GENERATOR"
cmake --build otter-browser-build --config Release -j $HOST_N_CORES
export QT_QPA_PLATFORM=minimal
UNAME=$(uname)
if [ "${CMAKE_GENERATOR:0:5}" = "Visua" ]; then
    otter-browser-build/Release/otter-browser.exe --version
elif [ "${CMAKE_GENERATOR:0:5}" = "MinGW" ]; then
    otter-browser-build/otter-browser.exe --version
elif [ "$UNAME" = "Darwin" ]; then
    "otter-browser-build/Otter Browser.app/Contents/MacOS/Otter Browser" --version
else
    otter-browser-build/otter-browser --version
fi
