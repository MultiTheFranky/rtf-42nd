@echo off
rem Download Hemtt from https://github.com/synixebrett/hemtt/releases/latest/download/windows-x64.zip
cd %~dp0
echo Downloading Hemtt
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/synixebrett/hemtt/releases/latest/download/windows-x64.zip', 'windows-x64.zip')"
tar -xf windows-x64.zip
del windows-x64.zip
