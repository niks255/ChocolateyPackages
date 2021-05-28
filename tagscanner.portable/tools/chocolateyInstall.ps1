﻿$ErrorActionPreference = 'Stop'

$InstallPath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = $InstallPath
    url            = 'https://www.xdlab.ru/files/tagscan-6.1.8.zip'
    url64          = 'https://www.xdlab.ru/files/tagscan-6.1.8_x64.zip'
    checksum       = 'eb2bc3d4c68208b9bcd36f924ff7a9b6f13427d3903733ad9e42b694c21257b9'
    checksum64     = 'a62b770315afca7ee8aaad6933f4c42cd02f9350db25240222f3006333ce956c'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$shortcutArgs = @{
    ShortcutFilePath = "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk"
    TargetPath       = "$InstallPath\\Tagscan.exe"
}

Install-ChocolateyShortcut @shortcutArgs
