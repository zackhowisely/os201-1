#!/bin/sh

DIRLIST=$(ls -d ../*/ | sed -e s/"\/"//g | sed -e s/".."//)

FILE="sandbox-201.txt"

[[ -f $FILE ]] || touch $FILE

for DIR in $DIRLIST
do
echo $DIR >> $FILE
done
