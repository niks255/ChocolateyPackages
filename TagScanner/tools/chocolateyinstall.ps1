$ErrorActionPreference = 'Stop'; # stop on all errors


$packageName = 'TagScanner' 
$url = 'http://www.xdlab.ru/files/tagscan-6.0.18-setup.exe' 

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' 
  url           = $url
  silentArgs    = "/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS"
  validExitCodes= @(0)
  registryUninstallerKey = 'TagScanner_is1'
  checksum      = '28ECADA41B6E37C57074B1A4125A0BAE'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs