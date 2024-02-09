@echo off
rem Execute buildRust.ps1 on the folder extensions with powershell
cd extensions
powershell -ExecutionPolicy Bypass -File buildRust.ps1
cd ..
