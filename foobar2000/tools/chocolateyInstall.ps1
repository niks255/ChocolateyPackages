$packageName = 'foobar2000'
$ErrorActionPreference = 'Stop'

$appurl = 'http://filehippo.com'+((Invoke-WebRequest -Uri 'http://filehippo.com/download_foobar2000/history').Links | Where-Object {$_.InnerHTML -NotLike '*Beta*'} | Where {$_.InnerHTML -Match 'Foobar2000 '+$version}).href 
$temp = ((Invoke-WebRequest -Uri $appurl).Links | Where-Object {$_.class -Like '*program-header-download-link green button-link active long download-button*'}).href
$url = 'http://filehippo.com'+((Invoke-WebRequest -Uri $temp ).Links | Where-Object {$_.outerHTML -Like '*id=download-link*'}).href

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe' 
  url           = $url
  silentArgs    = '/S'
  validExitCodes= @(0)
  checksum      = '63454F7A0E69DAB9B3FE2DFC9A2C6FC6'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs