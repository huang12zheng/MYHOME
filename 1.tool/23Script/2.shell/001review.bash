#curpath=$(cd "$(dirname "$0")"; pwd)
curpath='I:\MYHOME\1.tool\23脚本\2.shell'
declare -A dictPath
for item in `cat "$curpath/review/filelist.txt"`
{
	item=`cygpath "$item"`
	key=${item##*/}
	key=${key%%.*}
	#echo $key
	dictPath[$key]=$item
}
#a='${!dictPath[*]}'
echo "KnowBaseList"
echo "${!dictPath[*]}"
echo "please input your review file"

for ((break_flag=0;break_flag!=1;null ))
do
	read fname
	for fnameitem in `echo ${!dictPath[*]}|xargs -n1`
	{
		
		#if [[ "$fname" =~ "$fnameitem" ]]; then
		#if [[ "$fname" ~= "$fnameitem" ]]; then
		if [[ ",$fnameitem" =~ ",$fname" ]]; then
			
			fname="$fnameitem"
			break_flag=1&&break
		fi
	}
done
echo "$fname"
fpath=${dictPath["$fname"]}
echo "$fpath"
#exit 1
#fpath="%1"
#[ -f "$fpath" ]||echo "file is not exist"; exit 1
if [ ! -f "$fpath" ]; then
	echo "file is not exist"
	exit 1
fi
#env="`cygpath -p 'C:\cygwin\home\Administrator\mydoucment\2工具\23脚本\0shell\3内容复习'`"
#lines=`wc -l "%fpath"`
run_flag="Y"
echo "do you need find another?n is game over."
while	[ "$run_flag" != "N" -a "$run_flag" != "n" ];
do
	context=`shuf -n1 "$fpath"`
	echo "$context"
	read -n1 run_flag
done
