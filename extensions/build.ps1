$BasePath = Split-Path -Parent $MyInvocation.MyCommand.Path
$BuildPath = Split-Path -Parent $BasePath
# Function to build extension
# Param: ExtensionName - Name of extension
# Param: X64 - Build x64 or x32
function Build-Extension {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ExtensionName,
        [Parameter(Mandatory = $true)]
        [boolean]$X64
    )

    # Check if have go
    

    if ($X64) {
        $ENV:GOARCH = "amd64"
        $ENV:CGO_ENABLED = 1
        Write-Host "Building x64 extension: $ExtensionName on $BuildPath"
        # go build -o $BuildPath\$ExtensionName"_x64.dll" -buildmode=c-shared $BasePath\$ExtensionName
        docker run --rm -it -v ${PWD}:/go/work -w /go/work -e GOARCH=amd64 -e CGO_ENABLED=1 x1unix/go-mingw:1.20  go build -o $BuildPath\$ExtensionName"_x64.dll" -buildmode=c-shared -ldflags '-w -s' $BasePath\$ExtensionName

        # Remove header file
        # Remove-Item $BuildPath\$ExtensionName"_x64.h"
    }
    else {
        $ENV:GOARCH = 386
        $ENV:CGO_ENABLED = 1
        Write-Host "Building x32 extension: $ExtensionName on $BuildPath"
        # go build -o $BuildPath\$ExtensionName".dll" -buildmode=c-shared $BasePath\$ExtensionName
        docker run --rm -it -v ${PWD}:/go/work -w /go/work -e GOARCH=386 -e CGO_ENABLED=1 x1unix/go-mingw:1.20 go build -o $BuildPath\$ExtensionName".dll" -buildmode=c-shared -ldflags '-w -s' $BasePath\$ExtensionName

        # Remove header file
        Remove-Item $BuildPath\$ExtensionName".h"
    }
}


# Loop folders and build extensions
Get-ChildItem -Path $BasePath -Directory | ForEach-Object {
    if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
        Write-Host "Docker not found, please install docker and try again"
        exit 1
    }
    docker pull x1unix/go-mingw:1.20
    Write-Host "Building extension: $($_.Name)"
    Build-Extension -ExtensionName $_.Name -X64 1
    Build-Extension -ExtensionName $_.Name -X64 0
}

