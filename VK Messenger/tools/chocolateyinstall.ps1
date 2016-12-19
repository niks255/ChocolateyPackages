$ErrorActionPreference = 'Stop'; # stop on all errors
 
 
$packageName = 'vkmessenger'
$url = 'https://desktop.vk.me/win32/master/vk_setup.exe'
$url64 = "https://desktop.vk.me/win64/master/vk_setup.exe"
 
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  silentArgs    = "/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS"
  validExitCodes= @(0)
  registryUninstallerKey = 'VK_is1'
}
 
Install-ChocolateyPackage @packageArgs