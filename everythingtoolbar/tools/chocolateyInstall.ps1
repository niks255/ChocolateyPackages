$ErrorActionPreference = 'Stop'; 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url64          = 'https://github.com/srwi/EverythingToolbar/releases/download/1.5.1/EverythingToolbar-1.5.1.msi'
  checksum64     = '53f0bf0fe11083f271ceb9c071a849327ae23905c66f59482d902b5484e6be68'
  checksumtype64 = 'sha256'
  SilentArgs     = "/qn /norestart"
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
