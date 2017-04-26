#!/bin/sh
#solist="notice secusett"
if [ $# -eq 1 ]; then
	solist=$1

solist=`echo $solist|sed 's/ /|/g'`
strings -f *.xml | grep -E $solist|awk -F "." '{print$1}'|uniq>xmllist
fi                                                            
#rm solist
#rm xmllist                                           
~                                                                                                       
~                                                                                                       
~                                                                                                       
~                             
