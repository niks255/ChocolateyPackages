$ErrorActionPreference = 'Stop'

$InstallPath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = $InstallPath
    url            = 'https://www.xdlab.ru/files/tagscan-6.1.17.zip'
    url64          = 'https://www.xdlab.ru/files/tagscan-6.1.17_x64.zip'
    checksum       = '442de61e422dc52e545771ef986d80c6ecba3f11faa6e24bda70dd3ddff23720'
    checksum64     = '1a6e97a83994b663f1209a0ebdefaf284335af09e19487dcfa47fdd728eff9ac'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$shortcutArgs = @{
    ShortcutFilePath = "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk"
    TargetPath       = "$InstallPath\\Tagscan.exe"
}

Install-ChocolateyShortcut @shortcutArgs
