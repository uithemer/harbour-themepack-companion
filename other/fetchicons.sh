#!/bin/bash

whoami

native=$(diff -r /usr/share/icons/hicolor/86x86/apps /usr/share/harbour-themepack-companion/native/86x86/apps | grep 'Only in /usr/share/icons/hicolor/86x86/apps' | awk '{print $4}')
apk=$(diff -r /var/lib/apkd /usr/share/harbour-themepack-companion/apk/86x86 | grep 'Only in /var/lib/apkd' | awk '{print $4}')

xdg-email email@email.com --subject "Icon request for Companion" --body "Hi,

Please consider including the following icons in your theme:

$native
$apk

Regards"
