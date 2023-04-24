$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName       = $env:ChocolateyPackageName
  fileType          = 'EXE'
  url64             = 'https://upload.object2.vk-apps.com/vk-me-desktop-dev-5837a06d-5f28-484a-ac22-045903cb1b1a/6.0.5/vk-messenger-6.0.5-build.16-x64.exe'
  checksum64        = '6ab523d498887cd9865c1ddcd3c2cc6303bfc2ec038f0399b1b962b811ad4105'
  checksumType64    = 'sha256'
  silentArgs        = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
