#!/bin/sh
exec curl -s -w "%{http_code}" -T "$1" -uannulen:$BINTRAY_KEY "https://api.bintray.com/content/qtproject/qtwebkit-qa/qa/$TRAVIS_BUILD_NUMBER/$1?publish=1"
