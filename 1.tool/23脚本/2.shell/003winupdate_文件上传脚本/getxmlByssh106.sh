#!/bin/sh
#solist="notice"
#echo $#
#echo $1
if [ $# -eq 1 ]; then
solist="$1"
scp /home/getxml.sh root@192.168.70.106:~/getxml
ssh root@192.168.70.106 <<EOF
cd config
sh ~/getxml $solist
cat xmllist
rm xmllist
EOF
fi