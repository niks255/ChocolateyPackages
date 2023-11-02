$ErrorActionPreference = 'Stop'

$InstallPath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = $InstallPath
    url            = 'https://www.xdlab.ru/files/tagscan-6.1.16.zip'
    url64          = 'https://www.xdlab.ru/files/tagscan-6.1.16_x64.zip'
    checksum       = 'd7354f85533b3e6f326ed403a418cc3fa96d349d98b855ea65d1b983c498cd4c'
    checksum64     = 'bc866610f649b5d8f21e3b3a04eeaac230d4b0742b90f5e82d8312082b66387c'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$shortcutArgs = @{
    ShortcutFilePath = "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk"
    TargetPath       = "$InstallPath\\Tagscan.exe"
}

Install-ChocolateyShortcut @shortcutArgs
