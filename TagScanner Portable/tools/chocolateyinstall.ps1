$ErrorActionPreference = 'Stop'; # stop on all errors

$version  = $env:ChocolateyPackageVersion
$binarypath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"
$url = "$('https://www.xdlab.ru/files/tagscan-' + $version + '.zip')"
$url64 = "$('https://www.xdlab.ru/files/tagscan-' + $version +'_x64.zip')"

$packageArgs = @{
  packageName       = $packageName
  UnzipLocation     = $binarypath
  url               = $url
  checksum          = 'ad0218a55c6e00c864f0f70628e7fbb4fb1f350ff030991e61ca7477bb167958'
  checksum64        = '7b5ea0f72f2cc46906b4b9ad04fae07dd78a92a0960f7acd5791d2daa3b834ae'
  checksumType      = 'sha256'
  checksumType64    = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk" -TargetPath "$binarypath\\Tagscan.exe"