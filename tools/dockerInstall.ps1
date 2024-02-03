# First Download the installer (wget is slow...)

(New-Object System.Net.WebClient).DownloadFile('https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe', 'docker-installer.exe')

# Install
start-process -wait docker-installer.exe " install --quiet"

# Clean-up
rm docker-installer.exe

# Run
start-process "$env:ProgramFiles\Docker\Docker\Docker Desktop.exe"

write-host "Done."