$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName       = $env:ChocolateyPackageName
  fileType          = 'EXE'
  url64             = 'https://upload.object2.vk-apps.com/vk-me-desktop-dev-5837a06d-5f28-484a-ac22-045903cb1b1a/latest/vk-messenger-x64.exe'
  checksum64        = '2809eb587d3125770d693a8a2ec407550131810766fd64e5748822b3d35dd40a'
  checksumType64    = 'sha256'
  silentArgs        = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
