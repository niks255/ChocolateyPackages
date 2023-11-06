$ErrorActionPreference = 'Stop'; 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url64          = 'https://github.com/srwi/EverythingToolbar/releases/download/1.3.1/EverythingToolbar-1.3.1.msi'
  checksum64     = '1697e2bef9ca9ec81a63e3340425dd1ba67af83470ad3c6dc226354f99f385dc'
  checksumtype64 = 'sha256'
  SilentArgs     = "/qn /norestart"
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
