$ErrorActionPreference = 'Stop'; 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url64          = 'https://github.com/srwi/EverythingToolbar/releases/download/1.0.3/EverythingToolbar-1.0.3.msi'
  checksum64     = '15df78b0127b5f922cf668ba3f0fcaae9343fa6a9f57de1511d913ea9934ddc8'
  checksumtype64 = 'sha256'
  SilentArgs     = "/qn /norestart"
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
