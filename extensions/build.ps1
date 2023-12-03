$BasePath = Split-Path -Parent $MyInvocation.MyCommand.Path
$BuildPath = Split-Path -Parent $BasePath
# Function to build extension
# Param: ExtensionName - Name of extension
# Param: X64 - Build x64 or x32
function Build-Extension {
    param(
        [Parameter(Mandatory=$true)]
        [string]$ExtensionName,
        [Parameter(Mandatory=$true)]
        [boolean]$X64
    )

    if ($X64) {
        $ENV:GOARCH = "amd64"
        $ENV:CGO_ENABLED = 1
        Write-Host "Building x64 extension: $ExtensionName on $BuildPath"
        go build -o $BuildPath\$ExtensionName"_x64.so" -buildmode=c-shared $BasePath\$ExtensionName
        go build -o $BuildPath\$ExtensionName"_x64.dll" -buildmode=c-shared $BasePath\$ExtensionName

        # Remove header file
        Remove-Item $BuildPath\$ExtensionName"_x64.h"
    } else {
        $ENV:GOARCH = 386
        $ENV:CGO_ENABLED = 1
        Write-Host "Building x32 extension: $ExtensionName on $BuildPath"
        go build -o $BuildPath\$ExtensionName".so" -buildmode=c-shared $BasePath\$ExtensionName
        go build -o $BuildPath\$ExtensionName".dll" -buildmode=c-shared $BasePath\$ExtensionName

        # Remove header file
        Remove-Item $BuildPath\$ExtensionName".h"
    }
}


# Loop folders and build extensions
Get-ChildItem -Path $BasePath -Directory | ForEach-Object {
    if($BaseBuilds -contains $_.Name) {
        return
    }
    Write-Host "Building extension: $($_.Name)"
    Build-Extension -ExtensionName $_.Name -X64 1
    Build-Extension -ExtensionName $_.Name -X64 0
}

