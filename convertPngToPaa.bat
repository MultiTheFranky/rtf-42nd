rem Define Arma 3 Tools directory
set ARMA3_TOOLS_DIR="C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Tools"

if not exist %ARMA3_TOOLS_DIR% (
  echo Arma 3 Tools directory does not exist, please check the path.
  exit
)

rem check if ImageToPAA.exe exists
if not exist %ARMA3_TOOLS_DIR%\ImageToPAA\ImageToPAA.exe (
  echo ImageToPAA.exe does not exist, please check the path.
  exit
)

rem Execute ImageToPAA.exe
%ARMA3_TOOLS_DIR%\ImageToPAA\ImageToPAA.exe %1

rem Check if ImageToPAA.exe was successful
if %ERRORLEVEL% neq 0 (
  echo ImageToPAA.exe failed, please check the logs.
  exit
)

rem Check if the paa file exists
if not exist %~dpn1.paa (
  echo %~dpn1.paa does not exist, please check the logs.
  exit
)

rem Delete the png file
del %1