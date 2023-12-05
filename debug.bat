@echo off
rem =========ZONE TO EDIT========
rem Define Disk
set ARMA3_PARAMS=-mod=!Workshop\@CBA_A3;!Workshop\@ace;z\rtf42 -world=empty -noPause -showScriptErrors -filePatching -skipIntro -noSplash -noPause -noPauseAudio
rem Define Arma 3 directory
set ARMA3_DIR="C:\Program Files (x86)\Steam\steamapps\common\Arma 3"
rem =============================

call mountDev.bat

rem create a loop 
:fullLoop

rem Execute buildExtensions.bat
call buildExtensions.bat

:loopBuildRestartOnly

rem Execute Hemtt Dev and get the return code
hemtt.exe dev
set HEMTT_DEV_RETURN_CODE=%ERRORLEVEL%

rem Check if Hemtt Dev was successful
if %HEMTT_DEV_RETURN_CODE% neq 0 (
  echo Hemtt Dev failed, please check the logs.
  goto armaClosed
)

rem Define Arma 3 executable
:loopRestartOnly
set ARMA3_EXE=%ARMA3_DIR%\arma3_x64.exe

rem Check if Arma 3 executable exists
if not exist %ARMA3_EXE% (
  echo Arma 3 executable does not exist, please check the path.
  exit
)

rem Run Arma 3
start "" %ARMA3_EXE% %ARMA3_PARAMS%

rem sleep for 5 seconds
timeout /t 5 >nul

rem start the monitoring script
start "Arma 3 Monitoring" monitoringLogs.bat

rem Check every 5 seconds if Arma 3 is still running
:loop
tasklist /fi "imagename eq arma3_x64.exe" | find /i /n "arma3_x64.exe" >nul
if errorlevel 1 goto armaClosed
timeout /t 5 >nul
goto loop
:armaClosed

rem close the monitoring script
taskkill /fi "WindowTitle eq Arma 3 Monitoring - monitoringLogs.bat" >nul

rem Restart options
ECHO 1.Build Extensions, Rebuild and Restart
ECHO 2.Rebuild and Restart
ECHO 3.Restart only
ECHO 4.Close
ECHO.

CHOICE /C 1234 /M "Select an option: "
IF ERRORLEVEL 4 GOTO stopDebug
IF ERRORLEVEL 3 GOTO loopRestartOnly
IF ERRORLEVEL 2 GOTO loopBuildRestartOnly
IF ERRORLEVEL 1 GOTO fullLoop

:stopDebug
exit