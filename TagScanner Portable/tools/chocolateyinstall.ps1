$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'TagScanner.portable' 
$binarypath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"
$url = 'https://www.xdlab.ru/files/tagscan-6.0.29.zip' 

$packageArgs = @{
  packageName   = $packageName
  UnzipLocation = $binarypath
  url           = $url
  checksum      = '85d08a80c56fa911c79dccc958516ddf871f3e4c4d91643fcac9d48316ebff2b'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk" -TargetPath "$binarypath\\Tagscan.exe"