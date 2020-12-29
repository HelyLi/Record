
启动服务
```sql
mysql.server start
```

登录
```sql
mysql -u root -p 123456
```

设置密码
```sql
set password = password('123456');
flush privileges;
```

创建数据库
```sql
create database book_db default character set utf8mb4 collate utf8mb4_unicode_ci;
```

删除数据库
```sql
drop database Analects;
```

显示数据库
```sql
show databases;
```

进入数据库
```sql
use database_name;
```

显示数据库所有表
```sql
show tables;
```

删除表
```sql
drop table table_name;
```

创建表
```sql
create table `analects_tb`(
	`catalogue` int not NULL comment '目录',
    `chapter` int not NULL comment '章节',
    `original` varchar(100) not NULL comment '古文',
    `translate` varchar(200) not NULL comment '今译',
    `quote` varchar(500) not NULL comment '引述',
    `wisdom1` varchar(100) not NULL comment '智慧',
    `wisdom2` varchar(100) not NULL comment '智慧',
    `wisdom3` varchar(100) not NULL comment '智慧',
    primary key `index` (`catalogue`,`chapter`)
) ENGINE=InnoDB DEFAULT charset=utf8mb4
```

analects_tb

目录--Catalogue
--学天
    --（一）。
    --（二）。
--问天

catalogue int
chapter int
original 古文 string
translate 今译 string
quote 引述 string
wisdom1 智慧 string
wisdom2 智慧 string
wisdom3 智慧 string