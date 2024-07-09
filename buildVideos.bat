@echo off
rem Check if NodeJS is installed in the path and if it is, execute the getVideos
where node >nul
if %ERRORLEVEL% EQU 0 (
  cd %~dp0\tools\getVideos && npm install && call npm start & cd ..\..
)
