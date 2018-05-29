确定团队Unity版本，使用5.6.4f1版本

[官方历史下载][unity5.6.4f1]

[破解文件下载][crack5.6.4f1]

MAC万能破解方法, 适用于5.x任何版本

`Unity3D license/Unity_v5.x.ulf` 拷贝到 `/Library/Application Support/Unity`

任意目录下运行

```shell
sudo perl -pi -e 's|\xB3\x01\x84\xC0\x75\x10\x31\xDB\x48\x8D\x3D|\xB3\x01\x84\xC0\xEB\x10\x31\xDB\x48\x8D\x3D|g' /Applications/Unity/Unity.app/Contents/MacOS/Unity
```

下载Android&iOS Build Support 官方组件

[Android Build Support][unity_Android_5.6.4f1]

Unity->File->Build Settrings
Android->Open Download Page
iOs->Open Download Page

如果下载速度比较慢则拷贝链接用某雷下载,下载完成后直接安装

设置 SDK JDK NDK 环境变量

Unity->Preferences...->ExternalTools


[unity5.6.4f1]: https://unity3d.com/cn/get-unity/download/archive?_ga=2.95582939.615303454.1513688104-735383829.1502779263
[crack5.6.4f1]: http://www.ceeger.com/forum/read.php?tid=23396&page=1
[unity_Android_5.6.4f1]: http://download.unity3d.com/download_unity/ac7086b8d112/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-5.6.4f1.pkg
