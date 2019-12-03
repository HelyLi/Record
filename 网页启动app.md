### 网页启动APP

---
##### 启动 ios 应用

* 添加域名到 `Capabilities` -> `Associated Domains` -> ``
* 构建 `apple-app-site-association`
```json
{
    "applinks": {
        "apps": [],
        "details": [
            {
                "appID": "2526ESU4R7.www.wan.bbmj.com",
                "paths": ["/"]
            }
        ]
    }
}
```
* `AppDelegate` 中处理通用链接

#### 启动 android 应用

* `AndroidManifest.xml`
```xml
<activity android:name="org.cocos2dx.lua.AppActivity"
	<intent-filter>
		<action android:name="android.intent.action.VIEW"/>
		<category android:name="android.intent.category.DEFAULT"/>
		<category android:name="android.intent.category.BROWSABLE" />
		<data android:host="wwbbmj.com" android:scheme="mj" />
	</intent-filter>
</activity>
```
* `AppActivity` 中处理链接，链接中附带启动信息 `internetEntry()`

获取
```
curl -v https://wwg01.com/.well-known/apple-app-site-association
```
龙岩 wwg01.com
莆仙 wwmj06.com
南平 wwg16.com
漳州 wwmj16.com
福州 gar3.com
肇庆 sxlwwmj.com
curl -v https://wwmj06.com/.well-known/apple-app-site-association

```json
ios:"wwbbmj://",ulink:"https://wwg16.com/",android:"mj://wwbbmj.com/"
```

[参考链接][1]

[1]: https://juejin.im/entry/5912bc79128fe10058695526
