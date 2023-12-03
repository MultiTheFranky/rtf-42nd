<p align="center">
    <img src="https://github.com/MultiTheFranky/rtf-42nd/raw/master/extras/logo_rtf42_ca.png" width="480">
</p>

<p align="center">
    <a href="https://github.com/MultiTheFranky/rtf-42nd/releases/latest">
        <img src="https://img.shields.io/badge/Version-0.1.0-blue.svg?style=flat-square" alt="rtf-42nd Version">
    </a>
    <a href="https://github.com/MultiTheFranky/rtf-42nd/issues">
        <img src="https://img.shields.io/github/issues-raw/MultiTheFranky/rtf-42nd.svg?style=flat-square&label=Issues" alt="rtf-42nd Issues">
    </a>
    <a href="https://github.com/MultiTheFranky/rtf-42nd/releases">
        <img src="https://img.shields.io/github/downloads/MultiTheFranky/rtf-42nd/total.svg?style=flat-square&label=Downloads" alt="rtf-42nd Downloads">
    </a>
    <a href="https://github.com/MultiTheFranky/rtf-42nd/actions/workflows/ci.yml">
        <img src="https://github.com/MultiTheFranky/rtf-42nd/actions/workflows/ci.yml/badge.svg" alt="CI">
    </a>
    <a href="https://github.com/MultiTheFranky/rtf-42nd/actions/workflows/release.yml">
        <img src="https://github.com/MultiTheFranky/rtf-42nd/actions/workflows/release.yml/badge.svg" alt="Release">
    </a>
    <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/MultiTheFranky/rtf-42nd">
</p>

<p align="center">
    <sup><strong>Requires the latest version of <a href="https://github.com/CBATeam/CBA_A3/releases">CBA A3</a> and <a href="https://github.com/acemod/ACE3/releases">ACE3</a>.<br/></strong></sup>
</p>

# 42nd RTF for Arma 3

## Requirements

-   Git (https://git-scm.com/downloads)

### Extensions

-   Golang compiler (https://golang.org/dl/) 1.19
-   TDD gcc compiler (https://sourceforge.net/projects/tdm-gcc/)

## Setup

1. Clone the repository

```bash
 git clone https://github.com/MultiTheFranky/rtf-42nd.git rtf42
```

2. Open the folder

```bash
 cd rtf42
```

3. Edit the setup (setup.bat) script

4. Edit the DISK, the ARMA3_DIR, P_DRIVE_DIR and the PROJECT_NAME variables as you want and save

```bash
 DISK="C:"
 ARMA3_DIR="C:\Program Files (x86)\Steam\steamapps\common\Arma 3"
 P_DRIVE_DIR="C:\Users\Public\Documents\Arma 3 - Other Profiles"
 PROJECT_NAME="rtf42"
```

5. Execute the setup script

```bash
 .\setup.bat
```

6. Delete the cloned repository

```bash
 cd ..
 rmdir /s /q rtf42
```

7. Go to `P:\z\rtf42` or `Arma3Projects\rtf42` and execute the debug script

```bash
 .\debug.bat
```

## Development

```bash
 .\debug.bat
```

Execute

```sqf
[] call ACE_PREP_RECOMPILE;
```

every time that you want to recompile the functions.
Or you can setup a keybind on custom action 20 on Arma 3.
