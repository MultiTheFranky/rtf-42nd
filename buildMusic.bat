rem Check if NodeJS is installed in the path and if it is, execute the getMusic
where node >nul
if %ERRORLEVEL% EQU 0 (
  cd %~dp0\tools\getMusic && npm install && call npm start & cd ..\..
)
