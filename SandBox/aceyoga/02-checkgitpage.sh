#!/bin/bash
# Author: Muhamad Yoga Mahendra (aceyoga) 
# 02-checkgitpage.sh 
# INFO:
# This script grabs all adjacent directories to this script's
# current directory to sandbox-201.txt.
# This script assumes that it is executed from 00-runall.sh.
#
# Version 0 (2020-04-07 01:45 AM UTC+7)
# Version 1 (2020-04-07 01:50 AM UTC+7)
#
# Reference: https://stackoverflow.com/questions/2924422/how-do-i-determine-if-a-web-page-exists-with-shell-scripting
# 
# This is a Free Software, feel free to modify or use.

UNAMELIST=$(cat 01-sandbox-201.txt)
OUT="02-GitHub-Pages-os201.txt"

[[ -e $OUT ]] && rm -f $OUT
touch $OUT


for name in $UNAMELIST
do
   echo checking $name \'s github pages existence.
   if curl --output /dev/null --silent --head --fail "https://$name.github.io/os201/"
   then
      printf "%-25s %d\n" "$name" 1 >> $OUT
   else
      printf "%-25s %s\n" "$name" 0 >> $OUT
   fi
done

