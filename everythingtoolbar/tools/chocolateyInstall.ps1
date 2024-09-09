$ErrorActionPreference = 'Stop'; 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url64          = 'https://github.com/srwi/EverythingToolbar/releases/download/1.4.1/EverythingToolbar-1.4.1.msi'
  checksum64     = 'e3b177af10305253c19486560b97bde36ae961f1475f308170641c0eb2b1f49c'
  checksumtype64 = 'sha256'
  SilentArgs     = "/qn /norestart"
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
