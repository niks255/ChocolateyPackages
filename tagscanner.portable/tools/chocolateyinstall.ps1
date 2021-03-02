$ErrorActionPreference = 'Stop'; # stop on all errors

$version  = $env:ChocolateyPackageVersion
$binarypath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"
$url = "$('https://www.xdlab.ru/files/tagscan-' + $version + '.zip')"
$url64 = "$('https://www.xdlab.ru/files/tagscan-' + $version +'_x64.zip')"

$packageArgs = @{
  packageName       = $env:ChocolateyPackageName
  UnzipLocation     = $binarypath
  url               = $url
  url64             = $url64
  checksum       = '44d11db39e31a0729880b6bcd468e38443e62bd6f1385dbcacddfe0cd8a1c3ba'
  checksum64     = '070d4bfa4ecb8b2f0cdc24c08b7a10c09d77d198ff8cb5a2e216c3da46cf64b6'
  checksumtype   = 'sha256'
  checksumtype64 = $checksumtype
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk" -TargetPath "$binarypath\\Tagscan.exe"
