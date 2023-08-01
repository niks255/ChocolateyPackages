$ErrorActionPreference = 'Stop'; 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = 'https://github.com/crystalidea/uninstall-tool/releases/download/v3.7.3/uninstalltool_setup.exe'
  checksum       = 'b0f762aa0adb806b7fceca629164438672182a52b0afc33df8bbe98b695090d1'
  checksumType   = 'sha256'
  silentArgs     = '/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
