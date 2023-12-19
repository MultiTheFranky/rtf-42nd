$BasePath = Split-Path -Parent $MyInvocation.MyCommand.Path
$BuildPath = Split-Path -Parent $BasePath

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "Docker not found, please install docker and try again"
    exit 1
}

Write-Host "Pulling docker images for build"
docker build -t rtf42/build-a3go:windows-so -f $BasePath/Dockerfile_windows.build .
docker build -t rtf42/build-a3go:linux-so -f $BasePath/Dockerfile_linux_x64.build .
docker build -t rtf42/build-a3go:linux-so-x86 -f $BasePath/Dockerfile_linux_x86.build .
docker volume create go-cache
# Loop folders and build extensions
Get-ChildItem -Path $BasePath -Directory | ForEach-Object {
    if ($_.Name -eq "internal") {
        return
    }

    Write-Host "Building extension: $($_.Name)"

    docker run --rm -v ${BuildPath}\extensions:/go/work -v go-cache:/go/cache -e GOCACHE=/go/cache -w /go/work -e GOARCH=386 -e CGO_ENABLED=1  rtf42/build-a3go:windows-so go build -o "./${_}.dll" -buildmode=c-shared -ldflags '-w -s' "./$($_)"
    docker run --rm -v ${BuildPath}\extensions:/go/work -v go-cache:/go/cache -e GOCACHE=/go/cache -w /go/work -e GOARCH=amd64 -e CGO_ENABLED=1 -v go-cache:/go/cache rtf42/build-a3go:windows-so  go build -o "./${_}_x64.dll" -buildmode=c-shared -ldflags '-w -s' "./$($_)"
    docker run --rm -v ${BuildPath}\extensions:/app -v go-cache:/go/cache -e GOCACHE=/go/cache -e GOOS=linux -e GOARCH=amd64 -e CGO_ENABLED=1 -v go-cache:/go/cache -e CC=gcc rtf42/build-a3go:linux-so go build -o "./${_}_x64.so" -linkshared -ldflags '-w -s' "./$($_)"
    docker run --rm -v ${BuildPath}\extensions:/app -v go-cache:/go/cache -e GOCACHE=/go/cache -e GOOS=linux -e GOARCH=386 -e CGO_ENABLED=1 -v go-cache:/go/cache -e CC=gcc rtf42/build-a3go:linux-so-x86 go build -o "./${_}.so" -linkshared -ldflags '-w -s' "./$($_)"

    Write-Host "Extension $($_) built. Moving to root folder"
    Move-Item -Path "${BuildPath}\extensions\$($_).dll" -Destination "${BuildPath}\$($_).dll" -Force
    Move-Item -Path "${BuildPath}\extensions\$($_)_x64.dll" -Destination "${BuildPath}\$($_)_x64.dll" -Force
    Move-Item -Path "${BuildPath}\extensions\$($_).so" -Destination "${BuildPath}\$($_).so" -Force
    Move-Item -Path "${BuildPath}\extensions\$($_)_x64.so" -Destination "${BuildPath}\$($_)_x64.so" -Force

    Write-Host "Extension $($_) moved to root folder"
}

