$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'TagScanner' 
$url = 'https://www.xdlab.ru/files/tagscan-6.0.23-setup.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe' 
  url           = $url
  checksum      = 'DECC21D8B7389D5D24E8AE0DF80522AE5EAA29C411D3B1272D1098534E8FEA22'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs