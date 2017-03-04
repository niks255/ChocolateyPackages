$ErrorActionPreference = 'Stop'; # stop on all errors


$packageName = 'TagScanner' 
$url = 'http://www.xdlab.ru/files/tagscan-6.0.19-setup.exe' 

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' 
  url           = $url
  checksum      = 'CACEFBA062CECFECDFB1D91FB607337E'
  checksumType  = 'md5'
  silentArgs    = "/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs