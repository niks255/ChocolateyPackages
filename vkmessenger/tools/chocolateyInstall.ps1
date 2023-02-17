$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName       = $env:ChocolateyPackageName
  fileType          = 'EXE'
  url               = 'https://desktop.userapi.com/win32/master/vk_setup.exe'
  url64             = 'https://desktop.userapi.com/win64/master/vk_setup.exe'
  checksum          = 'ec05c474ae2684baf47cb1a713ff0ee866406b6e5bd57fec8f60c7931d7815c7'
  checksum64        = 'fc07a8c53b6418b512ec0f323dc2ee20bcb7e33edb5db384ef86745ce1aaddc8'
  checksumType      = 'sha256'
  checksumType64    = 'sha256'
  silentArgs        = '/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS'
  validExitCodes= @(0)
}

Remove-Process -NameFilter 'VK' -PathFilter 'VK' | Out-Null
Install-ChocolateyPackage @packageArgs
