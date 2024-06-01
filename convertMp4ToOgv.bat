@echo off
rem Define Arma 3 Tools directory
set FFMPEG_PATH=%0\..\tools\ffmpeg.exe

if not exist %FFMPEG_PATH% (
  echo ffmpeg.exe does not exist, please check the path.
  exit
)

rem Execute ffmpeg.exe with parameters -i input.mp4 -c:v libtheora -q:v 7 -c:a libvorbis -q:a 4 intro.ogv
%FFMPEG_PATH% -v quiet -stats -i %1 -c:v libtheora -q:v 7 -c:a libvorbis -q:a 4 %~dpn1.ogv

rem Check if ffmpeg.exe was successful
if %ERRORLEVEL% neq 0 (
  echo ffmpeg.exe failed, please check the logs.
  exit
)

rem Check if the ogv file exists
if not exist %~dpn1.ogv (
  echo %~dpn1.ogv does not exist, please check the logs.
  exit
)

rem Delete the mp4 file
del %1