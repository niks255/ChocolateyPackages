$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'TagScanner' 
$url = 'https://www.xdlab.ru/files/tagscan-6.0.27-setup.exe' 

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe' 
  url           = $url
  checksum      = 'DFD0D3AADB6C49D03E922C17347227C468B55D3DDC8DABB2B0CBA76EA6B4EE46'
  checksumType  = 'sha256'
  silentArgs    = "/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs