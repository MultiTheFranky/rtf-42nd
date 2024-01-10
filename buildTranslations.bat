rem Check if NodeJS is installed in the path and if it is, execute the translator
where node >nul
if %ERRORLEVEL% EQU 0 (
  cd %~dp0\tools\translator && npm install && call npm start & cd ..\..
)
