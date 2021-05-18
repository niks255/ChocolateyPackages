$ErrorActionPreference = 'Stop'; 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url            = 'https://github.com/stnkl/EverythingToolbar/releases/download/0.6.3/EverythingToolbar-0.6.3.msi'
  checksum       = '55f33b29e9a7b4c50729d96f8826d7def44d112f5342daa8a8f3db6cdb8e97ad'
  checksumType   = 'sha256'
  SilentArgs     = "/qn /norestart"
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
