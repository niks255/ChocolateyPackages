$ErrorActionPreference = 'Stop'

$InstallPath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = $InstallPath
    url            = 'https://www.xdlab.ru/files/tagscan-6.1.19.zip'
    url64          = 'https://www.xdlab.ru/files/tagscan-6.1.19_x64.zip'
    checksum       = '10f434bd1a7a61f1874457d852ee8d826a938f7852f85ccd19e5200829ba8120'
    checksum64     = '9762bc33584b373a214cbb891aad219803901bf1edf51f37538a54365fbca6bb'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$shortcutArgs = @{
    ShortcutFilePath = "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk"
    TargetPath       = "$InstallPath\\Tagscan.exe"
}

Install-ChocolateyShortcut @shortcutArgs
