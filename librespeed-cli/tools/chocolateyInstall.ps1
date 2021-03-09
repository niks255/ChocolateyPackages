$ErrorActionPreference = 'Stop';

$version  = $env:ChocolateyPackageVersion

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  UnzipLocation  = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" 
  url            = 'https://github.com/librespeed/speedtest-cli/releases/download/v1.0.7/librespeed-cli_1.0.7_windows_386.zip'
  url64          = 'https://github.com/librespeed/speedtest-cli/releases/download/v1.0.7/librespeed-cli_1.0.7_windows_amd64.zip'
  checksum       = '1965d7bf4e90db32b5e49dd638d585523f86b762a10229bc0abb20429030b380'
  checksum64     = '635ed0d4a1575c36d00a09c0dd08023ac6e99198b3336656bedcaa0b6d546f07'
  checksumtype   = 'sha256'
  checksumtype64 = $checksumtype
}

Install-ChocolateyZipPackage @packageArgs
