```git
git init
git add filename
git rm filename(delete filename)
git commit -m "first commit"
git pull(同步远程代码)
git push
```

重新提交.gitignore
```git
git rm -r --cached .
```

回滚
```git

```

创建新的开发分支
```
git co -b dev
```

新建Tag
```
git tag -a v1.4 -m 'my version 1.4'
git push origin v1.4
```

删除远程分支
```
git push origin --delete xxx
```

删除远程tag
```
git tag -d v3.9.3
git push origin :refs/tags/v3.9.3
```

克隆最近的一次commit
```git
git clone --depth 1 ssh://git@39.108.152.6:3001/LocalGame/lymj-v2.git
git remote set-branches origin 'dev'
git fetch --depth 1 origin dev
git checkout dev
```

/Users/triangle/Library/Developer/Xcode/DerivedData/