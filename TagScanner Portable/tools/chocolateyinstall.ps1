$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'TagScanner.portable' 
$binarypath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"
$url = 'https://www.xdlab.ru/files/tagscan-6.0.23.zip' 

$packageArgs = @{
  packageName   = $packageName
  UnzipLocation = $binarypath
  url           = $url
  checksum      = '621AE295FBF9AC22DFAA2E6E0FBC20BBD7159CB45C6442A305EFCC63EFB4B42D'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk" -TargetPath "$binarypath\\Tagscan.exe"