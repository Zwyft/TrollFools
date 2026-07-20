#!/bin/sh

XCCONFIG_NAME=TrollFools/Version.xcconfig
VERSION=$(awk -F "=" '/VERSION/ {print $2}' $XCCONFIG_NAME | tr -d ' ')
BUILD_NUMBER=$(awk -F "=" '/BUILD_NUMBER/ {print $2}' $XCCONFIG_NAME | tr -d ' ')

mkdir -p packages tipa_tmp/Payload
cp -rp $THEOS_STAGING_DIR/Applications/TrollFools.app tipa_tmp/Payload/
chmod 0644 tipa_tmp/Payload/TrollFools.app/Info.plist

cd tipa_tmp
zip -qr ../packages/TrollFools_$VERSION-$BUILD_NUMBER.tipa Payload
cd ..
rm -rf tipa_tmp
