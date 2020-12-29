
#!/bin/bash
# echo "Hello World!"
# read Person
# echo "Hello $Person"

# url=http://baidu.com
# echo $url
# echo ${url}

qz_svn=https://39.108.152.6/svn/qzmj/trunk/lua-client/hot-update-res
echo $qz_svn
svn_list=$(svn list ${qz_svn})
# svn_list=`svn list ${qz_svn}`
readonly svn_list
echo $svn_list



