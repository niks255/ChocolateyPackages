$ErrorActionPreference = 'Stop'

$InstallPath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = $InstallPath
    url            = 'https://www.xdlab.ru/files/tagscan-6.1.9.zip'
    url64          = 'https://www.xdlab.ru/files/tagscan-6.1.9_x64.zip'
    checksum       = 'a480194472a117dca5bad88a40f79c73cd24dcd0bf7bf8be7c247e3e0e4037e2'
    checksum64     = '91aefde00c2539a84e2811752a0c26332c715aa1dffdf12dda9ab0a29f98e85c'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$shortcutArgs = @{
    ShortcutFilePath = "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk"
    TargetPath       = "$InstallPath\\Tagscan.exe"
}

Install-ChocolateyShortcut @shortcutArgs
