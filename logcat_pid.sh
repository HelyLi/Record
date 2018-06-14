#!/bin/bash
echo "input packageName"
packageName=$1
pid=`adb shell ps | grep $packageName | awk '{print $2}'`
adb logcat | grep --color=auto $pid
