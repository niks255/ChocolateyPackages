$packageName = "foobar2000"
$url = 'https://www.foobar2000.org/files/b6c35db0fc21776e3d7c83c752f98623/foobar2000_v1.3.13.exe' 

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' 
  url           = $url
  silentArgs    = "/S"
  validExitCodes= @(0)
  registryUninstallerKey = 'foobar2000'
  checksum      = '90C7E45C11283B298B9D33A243BDDD91'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs