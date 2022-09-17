#!/bin/sh

cp kubenav.sh /usr/bin/kubenav
chmod a+x /usr/bin/kubenav

cp kubenav.png /usr/share/icons

mkdir -p /usr/share/kubenav
cp -r data /usr/share/kubenav

mkdir -p /usr/lib/kubenav
cp -r lib/* /usr/lib/kubenav

cp kubenav.desktop /usr/share/applications/kubenav.desktop
chmod a+x /usr/share/applications/kubenav.desktop
