rem Loop through all folders in addons recursively and convert all png files to paa files
for /r addons %%f in (*.png) do (
  echo Converting %%f
  call convertPngToPaa.bat %%f
)