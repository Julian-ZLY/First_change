#! /bin/bash 

# 1. 创建一个函数能接收两个参数；
#    1）第一个参数为URL，即可下载的文件；
#    2）第二个参数为目录，即下载后保存的位置； 

# 2. 如果用户给的目录不存在，则提示用户是否创建；
#    如果创建就继续执行；否则，函数返回一个51的错误值给调用脚本。 

# 3. 如果给的目录存在，则下载文件；下载命令执行结束后，测试文件下载成功与否；
#    如果成功，则返回0给调用脚本；否则，返回52给调用脚本。

URL='http://pic33.nipic.com/20131007/13639685_123501617185_2.jpg'

function get_file() {
    read -p '输入存储目录：' path 

    if [ ! -d "${path}" ]; then 
       read -p "目录不存在，是否创建：（Y、N）" request 
       [ ${request} == "Y" ] && mkdir ${path}; wget ${URL} -P ${path} || echo "退出脚本`exit 51`"
    else 
       wget ${URL} -P "${path}"
       if [ $? -eq 0 ]; then 
           echo "下载成功" 
       else 
           echo "下载失败"
	   exit 52 
       fi
    fi 
}

get_file 



