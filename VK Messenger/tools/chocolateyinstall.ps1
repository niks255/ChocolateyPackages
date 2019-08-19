$ErrorActionPreference = 'Stop'; # stop on all errors
 
 
$packageName = 'vkmessenger'
$url = 'https://desktop.vk.me/win32/master/vk_setup.exe'
$url64 = "https://desktop.vk.me/win64/master/vk_setup.exe"
 
$packageArgs = @{
  packageName       = $packageName
  unzipLocation     = $toolsDir
  fileType          = 'EXE'
  url               = $url
  url64bit          = $url64
  checksum          = '8bceee212b2f477c902b92cedc085573bc0dc8872f5938d14c8dba38be6a3240'
  checksum64        = '42e6da278c183294ffcd8d07e9fedd17ecee491a8d1d41628af643b8d21bdbc0'
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