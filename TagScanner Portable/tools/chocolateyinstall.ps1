$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'TagScanner.portable' 
$binarypath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"
$url = 'https://www.xdlab.ru/files/tagscan-6.1.0.zip'
$url64 = "https://www.xdlab.ru/files/tagscan-6.1.0_x64.zip"

$packageArgs = @{
  packageName       = $packageName
  UnzipLocation     = $binarypath
  url               = $url
  checksum          = '51f226fe5e8bd3656fcd9486e4834c2c0873c771c0838cb31fa551ebd951c302'
  checksum64        = '6b53c2873b2f80c1bd655a2df22910a58fe6519635f1acd11e45c2f4a63212df'
  checksumType      = 'sha256'
  checksumType64    = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk" -TargetPath "$binarypath\\Tagscan.exe"