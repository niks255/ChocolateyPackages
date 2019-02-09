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
  checksum          = '5738E5BBCC943FADAC78B40E58B30E3C9D00108D6EF05F3DDEBCF408CA991BF7'
  checksum64        = '04EF3C5A21044ACA377B3EE05E2F71156579D04A53F2A28464EEFB00E4BE58F6'
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