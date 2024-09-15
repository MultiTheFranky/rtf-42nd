@echo off

rem call mountDev.bat

rem create a loop
:fullLoop

rem Check if HEMMT is installed
if not exist hemtt.exe (
  echo Hemtt is not installed, please check the README.
  exit
)
hemtt launch

rem sleep for 5 seconds
timeout /t 5 >nul

rem start the monitoring script
start "Arma 3 Monitoring" monitoringLogs.bat

rem Check every 5 seconds if Arma 3 is still running
:loop
tasklist /fi "imagename eq arma3_x64.exe" | find /i /n "arma3_x64.exe" >nul
if errorlevel 1 goto armaClosed
timeout /t 1 >nul
goto loop
:armaClosed

rem close the monitoring script
taskkill /fi "WindowTitle eq Arma 3 Monitoring - monitoringLogs.bat" >nul

rem Restart options
ECHO 1.Restart
ECHO 2.Close
ECHO.

CHOICE /C 123 /M "Select an option: "
IF ERRORLEVEL 2 GOTO stopDebug
IF ERRORLEVEL 1 GOTO fullLoop

:stopDebug
exit
