@echo off
rem =========ZONE TO EDIT========
rem Define Disk
set ARMA3_PARAMS=-mod="!Workshop\@CBA_A3;!Workshop\@ace;!Workshop\@RHSUSAF;!Workshop\@Zeus Enhanced;!Workshop\@Zeus Enhanced - ACE3 Compatibility;!Workshop\@CUP Units;!Workshop\@CUP Weapons;z\rtf42"
set ARMA3_FULL_PARAMS=-mod="!Workshop\@3den Enhanced;!Workshop\@ACRE Animations;!Workshop\@ACRE2;!Workshop\@ACSTG AI Cannot See Through Grass;!Workshop\@Add Remove Map Labels;!Workshop\@Advanced Rappelling - Reworked;!Workshop\@Advanced Weapon Mounting;!Workshop\@Alex Mini Mod;!Workshop\@Align;!Workshop\@Alternative Running;!Workshop\@Arganiny's Tunnels Project;!Workshop\@BackpackOnChest - Redux;!Workshop\@Better Inventory;!Workshop\@Breach;!Workshop\@cTab;!Workshop\@CUP Terrains - Core;!Workshop\@CUP Terrains - Maps;!Workshop\@CUP Vehicles;!Workshop\@Death and Hit reactions;!Workshop\@Deformer;!Workshop\@DUI - Squad Radar;!Workshop\@Eden Extended Objects;!Workshop\@Eden Objects;!Workshop\@Enhanced Movement;!Workshop\@Enhanced Movement Rework;!Workshop\@Extended Morale System;!Workshop\@Foxtrot Paramilitary Gear Pack v2;!Workshop\@GEARSOC - Deluxe Edition;!Workshop\@GGE- Captive Animations-FixedKey;!Workshop\@GGE Core;!Workshop\@GGE NVG Animation;!Workshop\@GRAD Sling Helmet;!Workshop\@Gruppe Adler Trenches;!Workshop\@Immerse;!Workshop\@Interrogation System;!Workshop\@Jbad;!Workshop\@JCA - P320;!Workshop\@Ladder Tweak Remastered;!Workshop\@LAMBS_Dangerfsm;!Workshop\@Max_Women;!Workshop\@Military Gear Pack;!Workshop\@No More Aircraft Bouncing;!Workshop\@OT Expansion Eden;!Workshop\@Pack Press;!Workshop\@PLP All in One;!Workshop\@Real Engine;!Workshop\@Rested Weapon Movement;!Workshop\@RHSAFRF;!Workshop\@Suppress;!Workshop\@Tactical Position Ready;!Workshop\@Takistan Civilians for CUP;!Workshop\@ToH Characters;!Workshop\@US Equipment Pack by Abb0tt;!Workshop\@VS ACE Static Line Jump;!Workshop\@White_Phosphor;!Workshop\@ZEI - Zeus and Eden Interiors;!Workshop\@ZEUS WARGAME RTS mod;!Workshop\@Zulu Headless Client ZHC;!Workshop\@CBA_A3;!Workshop\@ace;!Workshop\@RHSUSAF;!Workshop\@Zeus Enhanced;!Workshop\@Zeus Enhanced - ACE3 Compatibility;!Workshop\@CUP Units;!Workshop\@CUP Weapons;z\rtf42"
rem Define Arma 3 directory
set ARMA3_DIR="C:\Program Files (x86)\Steam\steamapps\common\Arma 3"
rem =============================

call mountDev.bat

rem create a loop
:fullLoop

rem Execute buildExtensions.bat
call buildExtensions.bat

:loopBuildRestartOnly

call buildTranslations.bat

call buildImages.bat

rem Check if HEMMT is installed
if not exist hemtt.exe (
  echo Hemtt is not installed, please check the README.
  exit
)

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
timeout /t 1 >nul
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
