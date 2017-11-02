清空adb
```
adb logcat -c && adb logcat
```

显示同一进程的所有输出
```
packageName=$1
pid=`adb shell ps | grep $packageName | awk '{print $2}'`
adb logcat | grep --color=auto $pid
```

设置匹配字符串颜色
```
adb logcat | grep --color=auto -i tag
```

