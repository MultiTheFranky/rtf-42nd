@echo off
rem Execute build.ps1 on the folder extensions with powershell
cd extensions
powershell -ExecutionPolicy Bypass -File build.ps1
cd ..