@echo off
if not exist hemtt.exe (
  echo Hemtt is not installed, please check the README.
  exit
)
hemtt.exe build