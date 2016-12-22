$packageName = "foobar2000"

$ErrorActionPreference = "Stop"

$url='https://softpedia-secure-download.com/dl/163d25bae81ec75618fecc6b3f823434/585c175f/100006492/software/multimedia/player/foobar2000_v1.3.14.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' 
  url           = $url
  silentArgs    = "/S"
  validExitCodes= @(0)
  checksum      = '63454F7A0E69DAB9B3FE2DFC9A2C6FC6'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs