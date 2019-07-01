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
  checksum          = '6cae9dc019ad12e949aedae291d3e3041d305bcdfd5ad6dbbfc59e9d3a13d5d4'
  checksum64        = 'a19ec14f7b789a7faed03cfbc529d5feb9ba883fc45bb7483c743be4e42f97ad'
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