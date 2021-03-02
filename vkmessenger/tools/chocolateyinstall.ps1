$ErrorActionPreference = 'Stop'; # stop on all errors

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType          = 'EXE'
  url               = 'https://desktop.userapi.com/win32/master/vk_setup.exe'
  url64bit          = 'https://desktop.userapi.com/win64/master/vk_setup.exe'
  checksum          = '4e4d646a4d1e345a86c6ea3ef2b1b5efd0a4c4c37e63f771b5d20fce2333d22d'
  checksum64        = 'ea8ee086acf14efbe45da576f7ad8ad66236f277dcc79f83f2ceafc1fb10e58e'
  checksumType      = 'sha256'
  checksumType64    = 'sha256'
  silentArgs        = "/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS"
  validExitCodes= @(0)
}

$process = 'VK'
if((Get-Process $process -ea SilentlyContinue) -ne $Null){ 
    Stop-Process -processname $process
 }

Install-ChocolateyPackage @packageArgs
