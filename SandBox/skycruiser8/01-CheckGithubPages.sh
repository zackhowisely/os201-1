#!/bin/bash
# 01-CheckGithubPages.sh
# ============================================================================
# Author: Rafi Muhammad Daffa (skycruiser8)
#
# INFO:
# This script continues on the work made by 00-CheckFolder.sh to check
# whether a Github user whose username is the name of a folder here has an
# os201 Github Pages site.
#
# VERSION:
# v1 (2020-03-29 12:57 UTC+7) - Change site checking to use grep
# v0 (2020-03-29 12:30 UTC+7) - Initial commit
#
# This is free software :)

CFSCRIPT="00-CheckFolder.sh"
CFOUT="sandbox-201.txt"
CGPOUT="GitHub-Pages-os201.txt"

FNOTFOUNDMSG="$CFSCRIPT is required but cannot be found"
CFERRORMSG="$CFOUT not found. Please use original 00-CheckFolder.sh"

[[ -e $CFSCRIPT ]] || (echo $FNOTFOUNDMSG;exit 0)

bash $CFSCRIPT

[[ -e $CFOUT ]] || (echo $CFERRORMSG;exit 0)

UNAMELIST=$(cat $CFOUT)

[[ -e $CGPOUT ]] && rm -f $CGPOUT

touch $CGPOUT

for II in $UNAMELIST
do
NOTFOUND=$(curl "https://$II.github.io/os201/" | grep "Site not found")
if [[ $NOTFOUND ]]
then
echo "$II 0" >> $CGPOUT
else
echo "$II 1" >> $CGPOUT
fi
done
