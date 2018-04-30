#!/bin/bash
program=$1
sudoPW=$2
if [[ -z "$program" ]]
then
	echo "Invalid script argument"

else
    if [ -z "$sudoPW" ]
    then
         read -sp 'Enter Password for sudo: ' sudoPW
    fi
    #for pid in `ps aux | grep $program | grep -v grep |  awk '{print $2}'` ; do  echo $sudoPW | sudo -S kill -9 $pid ; done
    echo $sudoPW | sudo -S pkill -f $program

fi