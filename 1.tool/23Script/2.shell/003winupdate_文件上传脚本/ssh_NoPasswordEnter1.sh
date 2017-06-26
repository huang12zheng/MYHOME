#!/bin/sh
echo please input user@IP like root@192.168.70.106
echo and you need input twice password,for you entering desc-machine
read -p "shell input:" entername
if [ "$entername" != "" ]; then
	ssh-keygen -P '' -f ~/.ssh/id_rsa 
	echo scp ~/.ssh/id_rsa.pub $entername:~/.ssh/id_rsa.pub
	scp ~/.ssh/id_rsa.pub $entername:~/.ssh/id_rsa.pub
	ssh $entername<<EOF
#	cat ~/.ssh/id_rsa.pub
	cat ~/.ssh/id_rsa.pub>>~/.ssh/authorized_keys
#	cat ~/.ssh/authorized_keys
EOF
fi
