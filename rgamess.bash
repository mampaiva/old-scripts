#!/bin/bash

if [ $# = 0 ]
 then
echo
echo 'Where is the input file?'
echo
exit 
fi

if [ $# = 1 ]
 then
echo
echo 'Where is the number of cores?'
echo
exit 
fi

LOG=${1%.*}.log

/usr/local/gamess/rungms $1 00 $2 >& $LOG 
rm /media/mateus/f5989797-b0c8-44eb-bf25-87a0f942c4d5/gamess/${1%.*}*
echo "The calculation '${1%.*}' is finished" | ssmtp mts381@gmail.com
