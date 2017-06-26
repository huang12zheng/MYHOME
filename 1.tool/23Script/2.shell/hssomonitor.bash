#!/bin/sh

#初始化begin
Directory='/home/ls1'
DirectorySo="$Directory/appcom"
DirectoryFileTimeDetail="$Directory/workspace"
#程序状态
#0初始值 1无历史修改时间信息 2有历史修改时间信息
ProcedureStatus=0
#跳转到directory

#初始化end

echo "跳转$DirectorySo"
cd $DirectorySo
#获取文件名
#FileName=`stat *.so|grep File|awk -F\` '{print $2}'|awk -F\' '{print $1}'`
#FileName=$(stat *.so|grep File|awk -F\` '{print $2}'|awk -F\' '{print $1}')
#FileName=$(find . -type f -name '*.so')
#declare -a FileName
#FileName=$(ls *.so)
FileName=($(ls *.so))
#FileNameNum=find   ./   -type f  -name '*.so' |   wc   -l
#FileNameNum=$(echo "$FileName"|wc -l)
FileNameNum=echo ${#FileName[*]}
#获取修改时间
ChangTime=($(stat *.so | grep -i Change | awk -F. '{print $1}' | awk '{print $2$3}'| awk -F- '{print $1$2$3}' | awk -F: '{print $1$2$3}'))
#ChangTimeNum=$(echo "$ChangTime"|wc -l)
ChangTimeNum=echo ${#ChangTime[*]}


#获取文件个数及修改时间个数
echo "文件个数${#FileName[*]}=修改时间个数${#ChangTime[*]}"

