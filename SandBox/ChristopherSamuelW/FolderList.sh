#!/bin/bash
# INFO : Mencari dan menuliskan semua nama folder di os201/SandBox

dirs = $(ls -d ../*/)
FILE = sandbox-201.txt
if [ -f FILE ];
  then rm FILE
fi

touch FILE

for dir_name in $dirs
do
  echo $dir_name >> FILE
done
