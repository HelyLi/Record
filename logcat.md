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
adb logcat | grep --color=auto -i lua
```

在emulator-5554模拟器上安装ebook.apk：  
```shell
adb -s emulator-5554 install ebook.apk   
```

在真机上安装ebook.apk：  
```shell
adb -s HT9BYL904399 install ebook.apk  
```
