$ErrorActionPreference = 'Stop'; 

$packageName = 'UninstallTool'
$url = 'https://www.crystalidea.com/downloads/uninstalltool_setup.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  checksum      = 'E5714626C3B6299369E33FFD8E40F62AA7228BD2FC0F7D28913D5EF2C86E7DD4'
  checksumType  = 'sha256'
  silentArgs    = "/verysilent /norestart"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs