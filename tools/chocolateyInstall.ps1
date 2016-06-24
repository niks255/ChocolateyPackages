$packageName = "foobar2000"
$url = 'http://www.foobar2000.org/files/34e98dc3b7f1288baf90bdc512e8412b/foobar2000_v1.3.10.exe' 

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' 
  url           = $url
  silentArgs    = "/S"
  validExitCodes= @(0)
  registryUninstallerKey = 'foobar2000'
  checksum      = '2994486afdcce7f78d80019a797a8ab2'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs