$ErrorActionPreference = 'Stop'; 

$packageName = 'UninstallTool'
$url = 'https://www.crystalidea.com/downloads/uninstalltool_setup.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  checksum      = 'cdbe9c10e822218b7ebf97c6bb3c60fd8c1622501ca1d946d8267dca8564addc'
  checksumType  = 'sha256'
  silentArgs    = "/verysilent /norestart"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs