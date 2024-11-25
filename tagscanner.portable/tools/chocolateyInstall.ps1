$ErrorActionPreference = 'Stop'

$InstallPath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = $InstallPath
    url            = 'https://www.xdlab.ru/files/tagscan-6.1.18.zip'
    url64          = 'https://www.xdlab.ru/files/tagscan-6.1.18_x64.zip'
    checksum       = '7b6b14506ada1532ad26007f834eb3753b32d0042b0fd2d8aa9b3b634dbb0b42'
    checksum64     = '760b6c6ca06aae98a7feb9123a456401d3e3f64e18c47f4d32c28c376829e555'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$shortcutArgs = @{
    ShortcutFilePath = "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk"
    TargetPath       = "$InstallPath\\Tagscan.exe"
}

Install-ChocolateyShortcut @shortcutArgs
