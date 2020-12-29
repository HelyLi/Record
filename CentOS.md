CentOS修改hosts文件及生效命令

```
root Ali_hz088400
hz ps088400
```

```shell
vim /etc/hosts
```

修改完成后生效命令
```shell
/etc/init.d/network restart
```

安装git
```
sudo yum install git
```

```
/bin/bash -c "$(curl -fsSL https://mirrors.ustc.edu.cn/Homebrew/install/master/install.sh)"
```

升级Git
https://www.cnblogs.com/Hi-blog/p/How-To-Update-Git-On-CentOS7.html


echo "export PATH=$PATH:/usr/local/curl/bin" >> /etc/profile

Centos7.4 更换系统自带curl
https://blog.csdn.net/tt_isv/article/details/81016792


ln -s /usr/local/git/bin/git /usr/bin/git
vi /etc/ld.so.conf


https://www.cnblogs.com/qingbaizhinian/archive/2004/01/13/12881937.html


https://www.cnblogs.com/Hi-blog/p/How-To-Install-Gitlab-On-CentOS7.html


Job for postfix.service failed because the control process exited with error code. See "systemctl status postfix.service" and "journalctl -xe" for details.

https://blog.csdn.net/Mrs_chens/article/details/104759472

安装GitLab

https://blog.csdn.net/xiegh2014/article/details/78802591

git clone -b 10-0-stable-zh https://gitlab.com/xhang/gitlab.git


CentOS上创建Sudo用户
https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-centos-quickstart

yum install patch -y patch -d /opt/gitlab/embedded/service/gitlab-rails -p1 < /tmp/10.0.0-zh.diff


免密登录
```shell
scp id_rsa.pub root@101.200.35.103:/root/.ssh/authorized_keys
```