@echo off
rem Loop through all folders recursively and convert all mp4 files to ogv files
for /r . %%f in (*.mp4) do (
  echo Converting %%f
  call convertMp4ToOgv.bat %%f
)