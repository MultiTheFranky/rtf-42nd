@echo off
rem Download Hemtt from https://github.com/synixebrett/hemtt/releases/latest/download/windows-x64.zip
cd %~dp0
echo Downloading Hemtt
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/synixebrett/hemtt/releases/latest/download/windows-x64.zip', 'windows-x64.zip')"
echo Extracting Hemtt
tar -xf windows-x64.zip
echo Cleaning up
del windows-x64.zip
echo Done
pause