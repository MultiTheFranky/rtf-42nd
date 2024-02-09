$BasePath = Split-Path -Parent $MyInvocation.MyCommand.Path
$BuildPath = Split-Path -Parent $BasePath

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker not found, please install docker and try again"
    exit 1
}

# Check if rust is installed
if (-not (Get-Command rustc -ErrorAction SilentlyContinue)) {
    Write-Host "Rust not found, please install rust and try again"
    exit 1
}

# Loop folders and build extensions
Get-ChildItem -Path $BasePath -Directory | ForEach-Object {
    Set-Location -Path $_.FullName

    Write-Host "Building extension: $($_.Name)"
    cross build --target x86_64-pc-windows-gnu --release

    Write-Host "Extension $($_) built. Moving to root folder"
    Move-Item -Path "${BuildPath}\extensions\$($_)\target\x86_64-pc-windows-gnu\release\$($_).dll" -Destination "${BuildPath}\$($_)_x64.dll" -Force

    Write-Host "Extension $($_) moved to root folder"
    Set-Location -Path $BuildPath\extensions
}

