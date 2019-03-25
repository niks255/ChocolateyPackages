$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'TagScanner.portable' 
$binarypath = "$([Environment]::GetFolderPath('ApplicationData'))\\TagScanner Portable"
$url = 'https://www.xdlab.ru/files/tagscan-6.0.34.zip' 

$packageArgs = @{
  packageName   = $packageName
  UnzipLocation = $binarypath
  url           = $url
  checksum      = 'b1f695b1d545159c69f78103a37d358f496798858d8ef1561c397f5e20107499'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$([Environment]::GetFolderPath('Desktop'))\\TagScanner Portable.lnk" -TargetPath "$binarypath\\Tagscan.exe"