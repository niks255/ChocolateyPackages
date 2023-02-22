$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName       = $env:ChocolateyPackageName
  fileType          = 'EXE'
  url64             = 'https://upload.object2.vk-apps.com/vk-me-desktop-dev-5837a06d-5f28-484a-ac22-045903cb1b1a/1.0.27/vk-messenger-1.0.27-build.11-x64.exe'
  checksum64        = 'f8705065257a8a37987de2b96c1d8552aad8d59f4e9daba01b1a431c4e852c1d'
  checksumType64    = 'sha256'
  silentArgs        = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
