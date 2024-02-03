$client = new-object System.Net.WebClient
$client.DownloadFile("https://github.com/GyanD/codexffmpeg/releases/download/6.1/ffmpeg-6.1-essentials_build.7z", "ffmpeg-6.1-essentials_build.7z")
& ${env:ProgramFiles}\7-Zip\7z.exe x "ffmpeg-6.1-essentials_build.7z" -y > $null
Move-Item -Path "ffmpeg-6.1-essentials_build/bin/ffmpeg.exe" -Destination "." -Force
Remove-Item -Path "ffmpeg-6.1-essentials_build" -Recurse
Remove-Item -Path "ffmpeg-6.1-essentials_build.7z"
