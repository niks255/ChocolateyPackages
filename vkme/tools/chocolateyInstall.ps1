$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName       = $env:ChocolateyPackageName
  fileType          = 'EXE'
  url64             = 'https://upload.object2.vk-apps.com/vk-me-desktop-dev-5837a06d-5f28-484a-ac22-045903cb1b1a/latest/win10/vk-messenger-x64.exe'
  checksum64        = 'dc620f1e89e8f710443fcda8fc7babe0a4cd7cf366cb243d3cad5a68a62fc3f9'
  checksumType64    = 'sha256'
  silentArgs        = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
