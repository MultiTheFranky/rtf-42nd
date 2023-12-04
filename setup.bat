@echo off
rem =========ZONE TO EDIT========
rem Define Disk
set DISK=D:
rem Define Arma 3 directory
set ARMA3_DIR="C:\Program Files (x86)\Steam\steamapps\common\Arma 3"
rem Define P: drive directory
set P_DRIVE_DIR=%DISK%\Arma3PDrive
rem Project name
set PROJECT_NAME=rtf42
rem =============================
rem Check if git is installed
where git
if errorlevel 1 (
  echo Git is not installed, please install it and try again.
  goto exit
)
rem Check if %P_DRIVE_DIR% exists
if not exist %P_DRIVE_DIR% (
  echo %P_DRIVE_DIR% does not exist, creating ...
  mkdir %P_DRIVE_DIR%
)
rem Mount P: drive
echo Mounting P: drive...
subst P: %P_DRIVE_DIR%
echo P: drive mounted.
rem Define based directory
set BASE_DIR=%DISK%\Arma3Projects
echo Checking if directories exist...
rem Check if directory exists
if not exist %BASE_DIR% (
  echo %BASE_DIR% does not exist, creating...
  mkdir %BASE_DIR%
)
rem Define ExternalSource directory
set EXTERNAL_SOURCE_DIR=%BASE_DIR%\ExternalSource
rem Check if directory exists
if not exist %EXTERNAL_SOURCE_DIR% (
  echo  %EXTERNAL_SOURCE_DIR% directory does not exist, creating...
  mkdir %EXTERNAL_SOURCE_DIR%
)
echo Directories checked.

rem Check if Arma 3 directory x and z exists
if not exist %ARMA3_DIR%\x (
  echo %ARMA3_DIR%\x directory does not exist, creating...
  mkdir %ARMA3_DIR%\x
)

if not exist %ARMA3_DIR%\z (
  echo %ARMA3_DIR%\z directory does not exist, creating...
  mkdir %ARMA3_DIR%\z
)

echo Cloning CBA_A3 repository...
rem Clone CBA_A3 to ExternalSource with name cba
git clone https://github.com/CBATeam/CBA_A3.git %EXTERNAL_SOURCE_DIR%\cba
echo Cloned CBA_A3 to %EXTERNAL_SOURCE_DIR%\cba
rem Do the symlink to the Arma 3 directory
echo Creating symlinks...
mklink /J %ARMA3_DIR%\x\cba %EXTERNAL_SOURCE_DIR%\cba
rem Create the folder x if it does not exist
set X_DIR_P=%P_DRIVE_DIR%\x
if not exist %X_DIR_P% (
  echo %X_DIR_P% directory does not exist, creating...
  mkdir %X_DIR_P%
)
mklink /J P:\x\cba %EXTERNAL_SOURCE_DIR%\cba
echo Created symlink %ARMA3_DIR%\x\cba to %EXTERNAL_SOURCE_DIR%\cba and P:\x\cba to %EXTERNAL_SOURCE_DIR%\cba

echo Cloning ACE3 repository...
rem Clone ACE3 to ExternalSource with name ace
git clone https://github.com/acemod/ACE3.git %EXTERNAL_SOURCE_DIR%\ace
echo Cloned ACE3 to %EXTERNAL_SOURCE_DIR%\ace
rem Do the symlink to the Arma 3 directory
mklink /J %ARMA3_DIR%\z\ace %EXTERNAL_SOURCE_DIR%\ace
rem Create the folder z if it does not exist
set Z_DIR_P=%P_DRIVE_DIR%\z
if not exist %Z_DIR_P% (
  echo %Z_DIR_P% directory does not exist, creating...
  mkdir %Z_DIR_P%
)
mklink /J P:\z\ace %EXTERNAL_SOURCE_DIR%\ace
echo Created symlink %ARMA3_DIR%\z\@ace to %EXTERNAL_SOURCE_DIR%\ace and P:\z\ace to %EXTERNAL_SOURCE_DIR%\ace

rem Create the folder of the project on ExternalSource if it does not exist
set PROJECT_DIR=%EXTERNAL_SOURCE_DIR%\..\%PROJECT_NAME%
if not exist %PROJECT_DIR% (
  echo %PROJECT_DIR% directory does not exist, creating...
  mkdir %PROJECT_DIR%
)
rem Clone the project to ExternalSource
echo Cloning project repository...
git clone https://github.com/MultiTheFranky/rtf-42nd.git %PROJECT_DIR%
echo Cloned project to %PROJECT_DIR%
echo Creating project symlinks...
rem Do the symlink to the Arma 3 directory
mklink /J %ARMA3_DIR%\z\%PROJECT_NAME% %PROJECT_DIR%\.hemttout\dev
mklink /J P:\z\%PROJECT_NAME% %PROJECT_DIR%
echo Created symlink %ARMA3_DIR%\z\%PROJECT_NAME% to %PROJECT_DIR%\.hemttout\dev and P:\z\%PROJECT_NAME% to %PROJECT_DIR%

echo Done.
pause

:exit
exit