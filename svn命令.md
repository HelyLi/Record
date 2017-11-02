svn 批量删除
```
svn st | grep ! | awk '{print $2}' | xargs svn delete
```

svn 批量添加
```
svn st | grep \? | awk '{print $2}' | xargs svn add
```

svn 修改url
```
svn switch --relocate --username lixiong --password 'lx20170619' https://106.75.2.162/svn/xxx https://39.108.152.6/svn/xxx
```

其他
```
svn checkout(co) url
svn commit(ci) -m "提交xxx"
svn st
svn update(up)
```
