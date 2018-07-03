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
  checksum          = '7b48c08199bcef5cb39bfd527c7ea2db0b5087d267047f77bdd39b07ccce77ab'
  checksum64        = '9a7ffcd3821f332410bf59c9630eb64af99f5abdaf2a234dc1f5d442304c7d83'
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