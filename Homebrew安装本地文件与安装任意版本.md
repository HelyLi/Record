/usr/local/Homebrew/Library/Taps/caskroom/homebrew-cask/Casks

下载homebrew-cask

```git
git clone https://github.com/caskroom/homebrew-cask
```

进入Casks

```shell
git log --> log.txt
```

找到旧版本的commit

```
commit e02ba7b56728ae9d855d746e7749e0ae7742cfca
```

进入 `/usr/local/Homebrew/Library/Taps/caskroom/homebrew-cask/Casks`

```shell
git checkout effe4bf7655e90ae54c710d570691c6040239003 unity.rb
```

安装 unity

```shell
brew cask install unity
```

如果brew 安装速度较慢，可以先拷贝链接用某雷下载

已下载atom为例

```shell
➜  ~ brew search atom
==> Searching local taps...
atomicparsley                                               homebrew/science/atompaw                                    sratom
datomic                                                     libatomic_ops
homebrew/science/atomic-pseudopotential-engine              mediatomb
==> Searching taps on GitHub...
caskroom/cask/atom                                                                        caskroom/versions/atom-beta
==> Searching blacklisted, migrated and deleted formulae...
➜  ~ brew cask install caskroom/cask/atom
==> Satisfying dependencies
==> Downloading https://github.com/atom/atom/releases/download/v1.23.1/atom-mac.zip
```

进入Homebrew 本地缓存文件

```shell
brew --cache

/Users/xxx/Caches/Homebrew

cd /Users/xxx/Caches/Homebrew

➜  Homebrew cd Cask
➜  Cask ls
atom--1.23.1.zip.incomplete
```

将用某雷下载的atom修改为 `atom--1.23.1.zip`

然后
```shell
brew cask install atom
```
