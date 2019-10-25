$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'TagScanner.portable' 
$binarypath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"
$url = 'https://www.xdlab.ru/files/tagscan-6.1.1.zip'
$url64 = "https://www.xdlab.ru/files/tagscan-6.1.1_x64.zip"

$packageArgs = @{
  packageName       = $packageName
  UnzipLocation     = $binarypath
  url               = $url
  checksum          = 'cebe8d3ae813925d9bc6c6bfb66dfd7744278f138e45f79b37c6919b4990df2d'
  checksum64        = '60993dd95c88c8cd99bbf51c5241b37050e93cf521c86847e959901de16e6879'
  checksumType      = 'sha256'
  checksumType64    = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk" -TargetPath "$binarypath\\Tagscan.exe"