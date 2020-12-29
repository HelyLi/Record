---
svn 批量删除
```
svn st | grep ! | awk '{print $2}' | xargs svn delete
```

---
svn 批量添加
```
svn st | grep \? | awk '{print $2}' | xargs svn add
```

---
svn 修改url
```
svn switch --relocate --username lixiong --password 'lx20170619' https://106.75.2.162/svn/xxx https://39.108.152.6/svn/xxx
```

---
其他
```shell
svn checkout(co) url
svn commit(ci) -m "提交xxx"
svn st
svn update(up)
```

---
回滚版本
```
更新到最新代码
svn update

找出要回滚的版本号
svn log [...]
可以是文件、目录或整个项目

如要了解详细情况
svn diff -r 28:25 [...]

回滚到版本号25
svn merge -r 28:25 [...]

确认回滚的结果
svn diff [...]

提交回滚
svn commit -m "Revert revision from r28 to r25,because of ..."
```

空文件夹
```shell
svn co --depth=empty https://39.108.152.6/svn/fzmj/trunk/lua-client
```
https://39.108.152.6/svn/qzmj/trunk/lua-client/mainGame_appstore

