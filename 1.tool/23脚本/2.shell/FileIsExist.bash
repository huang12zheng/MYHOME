#!/bin/sh

echo "请输入你要判断的文件的完整路径:"
#read filepath #入参传入
if [$# -lt 1]; then
	echo "未输入文件"
	exit 1
fi

if [ -f $1 ]; then
	echo "文件存在!"
	echo "文件在$filepath"
else
	echo "文件不存在或者您输入的路径有误"
fi

#end