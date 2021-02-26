$ErrorActionPreference = 'Stop'; # stop on all errors
 
 
$packageName = 'vkmessenger'
$url = 'https://desktop.userapi.com/win32/master/vk_setup.exe'
$url64 = "https://desktop.userapi.com/win64/master/vk_setup.exe"
 
$packageArgs = @{
  packageName       = $packageName
  unzipLocation     = $toolsDir
  fileType          = 'EXE'
  url               = $url
  url64bit          = $url64
  checksum          = '1a9e221dff40305cf6994d10ac3eecfcaf3b09a6bcc87cc4b1c32cc9bee6fb70'
  checksum64        = '86a1c409190ecf5bf52c025ebeebea0c3da4545270f57205ab2e40fec25105d5'
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