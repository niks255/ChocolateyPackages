$ErrorActionPreference = 'Stop'; 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url64          = 'https://github.com/stnkl/EverythingToolbar/releases/download/1.0.2/EverythingToolbar-1.0.2.msi'
  checksum64     = '378b9b7a946a79ce83c31b1b1683e0d048d5880a3ce067ee75a4ef2a075958ed'
  checksumtype64 = 'sha256'
  SilentArgs     = "/qn /norestart"
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
