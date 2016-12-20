$packageName = "foobar2000"

$pwd = "$(split-path -parent $MyInvocation.MyCommand.Definition)"
Import-Module "$($pwd)\Get-FilenameFromRegex.ps1" -Force
# Why does an import failure on this module not throw an error?

$ErrorActionPreference = "Stop"

# TODO: Remvoe all this junk and use chocolatey core extension to download installer
try {
  $url1 = Get-FilenameFromRegex "http://www.filehippo.com/download_foobar2000/history/" 'download_foobar2000/([\d]+)/"[^>]*>Foobar2000 1.3.13<' 'http://www.filehippo.com/download_foobar2000/$1/'
} catch {
  Write-Host "Looking for alternative url"
  $latestVersion = Get-FilenameFromRegex "http://www.filehippo.com/download_foobar2000/" 'itemprop\=\"name\"\>[\s\r\n]*Foobar2000 (1.3.13)<' '$1'
  if ($latestVersion -ne '') {
    Write-Host "Attempting to find url for latest version"
    $url1 = Get-FilenameFromRegex "http://www.filehippo.com/download_foobar2000/" 'download_foobar2000/download/([\w\d]+)/[^>]*>[\s\r\n]*<span>Download Latest Version<' 'http://www.filehippo.com/en/download_foobar2000/download/$1/'
  }
}

Write-Host "Found URL that redirects to the download url: $url1"

$url2 = Get-FilenameFromRegex "$url1" 'download_foobar2000/download/([\w\d]+)/' 'http://www.filehippo.com/en/download_foobar2000/download/$1/'
Write-Host "Found secondary url that redirects to the download url: $url2"

$url3 = Get-FilenameFromRegex "$url2" '/download/file/([\w\d]+)/' 'http://www.filehippo.com/download/file/$1/'
Write-Host "Found download URL: $url3"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' 
  url           = $url3
  silentArgs    = "/S"
  validExitCodes= @(0)
  checksum      = '90C7E45C11283B298B9D33A243BDDD91'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs