本地
```shell
cd ~/.ssh
scp id_rsa.pub root@101.200.35.103:~/.ssh/id_rsa.pub
```

阿里云的虚拟机
```shell
ssh root@101.200.35.103
cd ~/.ssh
cat id_rsa.pub >> authorized_keys
rm id_rsa.pub
```