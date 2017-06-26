REM date=2017-01-25 ÖÜÈý
REM time=21:58:44.94
set day=%date:~0,4%%date:~5,2%%date:~8,2%_
REM %time:~0,2%%time:~3,2%
set filename=QTP_%day%.vbs
echo off>%filename%