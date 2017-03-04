$ErrorActionPreference = 'Stop'; 

$packageName = 'UninstallTool'
$url = 'https://www.crystalidea.com/downloads/uninstalltool_setup.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  silentArgs    = "/verysilent /norestart"
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'DEEAE93194739971AE1BA64C4C5F82A7'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs