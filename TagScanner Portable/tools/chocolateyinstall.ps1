$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'TagScanner.portable' 
$binarypath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"
$url = 'https://www.xdlab.ru/files/tagscan-6.1.2.zip'
$url64 = "https://www.xdlab.ru/files/tagscan-6.1.2_x64.zip"

$packageArgs = @{
  packageName       = $packageName
  UnzipLocation     = $binarypath
  url               = $url
  checksum          = 'b08cc5185d6c60c6fd372a5ccc3e524aff8f4e7cc345d665c82f9c56bca0aae3'
  checksum64        = 'c252f8d718c02ff5d35c5d60a80416c8552ee096e22a9a32e754309a0bd2c248'
  checksumType      = 'sha256'
  checksumType64    = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk" -TargetPath "$binarypath\\Tagscan.exe"