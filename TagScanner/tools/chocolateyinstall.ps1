$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'TagScanner' 
$url = 'https://www.xdlab.ru/files/tagscan-6.0.26-setup.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe' 
  url           = $url
  checksum      = 'F8A373EA5FC98D4399A7F55D12F2A21C526B3FFD74BC6B848907B5481E92D2EF'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs