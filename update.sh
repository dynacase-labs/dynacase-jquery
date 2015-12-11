#!/usr/bin/env bash

JQUERY_VERSION=$(tail jquery_version)
rm -rf ./bower_components/
bower install jquery=jquery#$JQUERY_VERSION
PACKAGE_VERSION=$(bower info jquery#$JQUERY_VERSION version | tail -n 1 | cut -d "'" -f 2)
cd ./bower_components
mkdir ./jquery/$PACKAGE_VERSION
mv ./jquery/dist/jquery.js ./jquery/$PACKAGE_VERSION/
mv ./jquery/dist/jquery.min.js ./jquery/$PACKAGE_VERSION/
zip -r "../jquery-$PACKAGE_VERSION.zip" ./jquery/$PACKAGE_VERSION/
cd ..
scp "jquery-$PACKAGE_VERSION.zip" distrib@ftp.anakeen.com:/share/ftp/third-party/
echo $PACKAGE_VERSION > VERSION