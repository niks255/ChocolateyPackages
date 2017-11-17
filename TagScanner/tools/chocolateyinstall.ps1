$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'TagScanner' 
$url = 'https://www.xdlab.ru/files/tagscan-6.0.25-setup.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe' 
  url           = $url
  checksum      = '271A49B7C2077A21170AA89EA709CE24CC1C8286391C12BAA5530C011B1BB7F2'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs