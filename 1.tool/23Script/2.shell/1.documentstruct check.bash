curpath=$(cd `dirname $0`; pwd) #$DOCUMENTHOMW
#[ "curpath" == "" ]&&curpath="/cygdrive/g/source/start"
[ "$#" != "2" ]&&echo "count of args is wrong";exit 1
p0folder="$1";test -d "$p0folder"||echo "p0folder is wrong";exit 2
p1folder="$2";test -d "$p1folder"||echo "p1folder is wrong";exit 2

function getfilelist()
{
	test -d "$1"||echo "'$1' is wrong folder";exit 2
	#Mainpath="$STARTHOME"
	ignorelist=`cat "$curpath\ignorelist.txt"`
	#folderpath="$1"
	#list=`find $folderpath`
	list=`find $1`
	reallist=`realpath $list`
	echo $reallist|grep -Ev $ignorelist`
}

depth=0
p0filelist=`find p0folder`