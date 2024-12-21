$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName       = $env:ChocolateyPackageName
  fileType          = 'EXE'
  url64             = 'https://upload.object2.vk-apps.com/vk-me-desktop-dev-5837a06d-5f28-484a-ac22-045903cb1b1a/latest/win10/vk-messenger-x64.exe'
  checksum64        = '45a00ace7ff281b0fd1a95be734813b27ba39c07e527f5247a62091719055dd3'
  checksumType64    = 'sha256'
  silentArgs        = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
