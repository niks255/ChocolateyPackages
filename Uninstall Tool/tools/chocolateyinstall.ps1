$ErrorActionPreference = 'Stop'; 

$packageName = 'UninstallTool'
$url = 'https://www.crystalidea.com/downloads/uninstalltool_setup.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  checksum      = '227B62F8115F67BE4F96FFBDF1EF98BD857454368FC17C296E0280B300186EE2'
  checksumType  = 'sha256'
  silentArgs    = "/verysilent /norestart"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs