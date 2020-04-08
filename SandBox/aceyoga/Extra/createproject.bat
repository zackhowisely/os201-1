@echo off
set /p input="Write your project name: "
@echo on
django-admin startproject %input%
@echo off
cd %input%
set /p appname="Write your starting app name: "
@echo on
django-admin startapp %appname%
@echo off
echo Moving requirements.txt from ppw database.
copy "C:\Users\Yoga Mahendra\Documents\Gitlab\django batch collections\requirements.txt" "%CD%"
copy "C:\Users\Yoga Mahendra\Documents\Gitlab\django batch collections\datas\*" "%CD%"
@echo on
pip install -r requirements.txt
echo Your Project named %input% with App %appname% has been successfully created!