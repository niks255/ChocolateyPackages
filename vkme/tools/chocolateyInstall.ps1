$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName       = $env:ChocolateyPackageName
  fileType          = 'EXE'
  url64             = 'https://upload.object2.vk-apps.com/vk-me-desktop-dev-5837a06d-5f28-484a-ac22-045903cb1b1a/latest/win10/vk-messenger-x64.exe'
  checksum64        = '59c8c4ffff619f1e22e5cab06264e85012b9b60bd76012922cf2299724b5d5b4'
  checksumType64    = 'sha256'
  silentArgs        = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
