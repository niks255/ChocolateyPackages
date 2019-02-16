$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'TagScanner.portable' 
$binarypath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"
$url = 'https://www.xdlab.ru/files/tagscan-6.0.33.zip' 

$packageArgs = @{
  packageName   = $packageName
  UnzipLocation = $binarypath
  url           = $url
  checksum      = '9138152f310cac065588f43cfeb7265e4938a3b62f7a4825c4f696f42f49df22'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk" -TargetPath "$binarypath\\Tagscan.exe"