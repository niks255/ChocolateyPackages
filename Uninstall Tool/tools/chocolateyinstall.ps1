$ErrorActionPreference = 'Stop'; 

$packageName = 'UninstallTool'
$url = 'http://www.crystalidea.com/downloads/uninstalltool_setup.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  silentArgs    = "/verysilent"
  validExitCodes= @(0, 3010, 1641)
  checksum      = 'ECBFF331BC6DC496ED8CDEE2D38031BF'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs