$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'TagScanner' 
$url = 'http://www.xdlab.ru/files/tagscan-6.0.20-setup.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe' 
  url           = $url
  checksum      = '0FE652E02E077C1D5907ECEAFDE7F5DE1B417EF8E78D0911B86A73645252C2F8'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs