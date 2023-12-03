@echo off
rem Script to monitor the Arma 3 game logs

rem Get last edited file in the Arma 3 logs directory
for /f "tokens=*" %%i in ('dir "C:\Users\%USERNAME%\AppData\Local\Arma 3\*.rpt" /o:d /t:w /b') do set lastLog=%%i

rem Monitor logs changes
powershell -command "type -wait "\""C:\Users\%USERNAME%\AppData\Local\Arma 3\%lastLog%"\""