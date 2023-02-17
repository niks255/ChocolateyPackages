$ErrorActionPreference = 'Stop'

$InstallPath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = $InstallPath
    url            = 'https://www.xdlab.ru/files/tagscan-6.1.14.zip'
    url64          = 'https://www.xdlab.ru/files/tagscan-6.1.14_x64.zip'
    checksum       = 'fc26171eefdf59db5d8025ba0521ab4ebda62002e9a2e824656c7a79f163e604'
    checksum64     = 'ba847a55748c1b7b3bae793ab953922b5a2eefbf42bed2f4e4dc6b3801ccf967'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$shortcutArgs = @{
    ShortcutFilePath = "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk"
    TargetPath       = "$InstallPath\\Tagscan.exe"
}

Install-ChocolateyShortcut @shortcutArgs
