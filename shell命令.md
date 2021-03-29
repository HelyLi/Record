rar 解压工具
```shell
brew install unrar
```

解压命令
```
unrar x xxx.rar
```

cocos 编译.so文件
```
cocos compile -p android --android-studio --no-apk -m release
cocos compile -p android -m release --android-studio --no-apk --ap android-19

cocos compile -p android -m release --no-apk --android-studio
```

###shell 脚本命令
Linux下递归删除同一类型文件
```shell
find . -name '*.zip' -type f -print -exec rm -rf {} \;
```
说明：
	"."    表示从当前目录开始递归查找
	“ -name '*.onetoc2' "根据名称来查找，要查找所有以.onetoc2结尾的文件
	" -type f "查找的类型为文件
	"-print" 输出查找的文件目录名
	最主要的就是-exec了，-exec选项后边跟着一个所要执行的命令，表示将find出来的文件或目录执行该命令。"rm -rf"表示执行删除操作，-r是递归处理，-f是强制删除
	exec选项后面跟随着所要执行的命令或脚本，然后是一对{}，一个空格和一个\，最后是一个分号

---
查看文件大小
```shell
du -h -d 1 ./
```

---
压缩目录中的文件夹
```shell
zip -r "xxx.zip" xxx
```

---
统计某文件夹下目录的个数
```shell
ls -l |grep "^ｄ"|wc -l
```

---
列出 /opt/soft 文件下面的子目录
```
ls -F /opt/soft |grep /$
```

---
macOS adb 截屏
```
adb shell screencap -p | perl -pe 's/\x0D\x0A/\x0A/g' > ./screenshot_$(date +%Y_%m_%d_%H_%M_%S).png
```

---
递归删除.git目录
```
find . -name ".git" -type d -exec rm -rf {} \;
```

---
递归删除后缀为.iml文件
```
find . -name "*.DS_Store" -type f -exec rm -rf {} \;
```

find . -name "*.png" -type f -exec open {} \;

```
idevice_id list 查看连接的设备udid
ideviceinstaller -i xxx.ipa 安装到设备
ideviceinstaller -u appid 卸载app
```

```
vim xxx.bin
:%!xxd
:%!xxd -r
```

ffmpeg 合并视频
```
./ffmpeg.exe -f concat -safe 0 -i ./fileToMerge.txt -c copy -y ./out.mp4
```

```
ln -s 【目标目录】 【软链接地址】
ln -s ../Cellar/python@3.7/3.7.9_1 /usr/local/opt/python 
```

GOMODULE常用命令
```
go mod init  # 初始化go.mod
go mod tidy  # 更新依赖文件
go mod download  # 下载依赖文件
go mod vendor  # 将依赖转移至本地的vendor文件
go mod edit  # 手动修改依赖文件
go mod graph  # 打印依赖图
go mod verify  # 校验依赖
```

mysql 数据目录
```
/usr/local/var/mysql
```

https://www.cnblogs.com/nzbbody/p/4391802.html


