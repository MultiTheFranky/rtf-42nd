@echo off
rem =========ZONE TO EDIT========
rem Define Disk
set DISK=D:
rem Define P: drive directory
set P_DRIVE_DIR=%DISK%\Arma3PDrive
rem =============================
rem Mount P: drive
echo Mounting P: drive...
subst P: %P_DRIVE_DIR%
echo P: drive mounted.