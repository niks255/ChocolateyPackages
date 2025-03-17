$ErrorActionPreference = 'Stop'; 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url64          = 'https://github.com/srwi/EverythingToolbar/releases/download/1.5.2/EverythingToolbar-1.5.2.msi'
  checksum64     = 'f464f5234324bf4d3ede40016571c201baf152a412c0cbc296d23f478af41962'
  checksumtype64 = 'sha256'
  SilentArgs     = "/qn /norestart"
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
