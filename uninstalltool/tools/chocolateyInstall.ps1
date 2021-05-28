﻿$ErrorActionPreference = 'Stop'; 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = 'https://github.com/crystalidea/uninstall-tool/releases/download/v3.5.10/uninstalltool_setup.exe'
  checksum       = 'e5714626c3b6299369e33ffd8e40f62aa7228bd2fc0f7d28913d5ef2c86e7dd4'
  checksumType   = 'sha256'
  silentArgs     = '/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
