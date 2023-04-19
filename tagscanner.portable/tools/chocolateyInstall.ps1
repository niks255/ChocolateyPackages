$ErrorActionPreference = 'Stop'

$InstallPath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = $InstallPath
    url            = 'https://www.xdlab.ru/files/tagscan-6.1.15.zip'
    url64          = 'https://www.xdlab.ru/files/tagscan-6.1.15_x64.zip'
    checksum       = 'f303d2dad7d9dfb2bdb67d266cb293a3bb553f7e0eedc9016fa31522d8441c2f'
    checksum64     = 'beec79185a1c961ec66c3afadb5b83680082dfb83b1ffad08fa81c6701481125'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$shortcutArgs = @{
    ShortcutFilePath = "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk"
    TargetPath       = "$InstallPath\\Tagscan.exe"
}

Install-ChocolateyShortcut @shortcutArgs
