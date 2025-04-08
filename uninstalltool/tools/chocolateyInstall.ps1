$ErrorActionPreference = 'Stop'; 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = 'https://github.com/crystalidea/uninstall-tool/releases/download/v3.7.4/uninstalltool_setup.exe'
  checksum       = '66b696e76af8e72272883e22e7f5e42e168195c2e42fddf6d9e4e59c8a003ee4'
  checksumType   = 'sha256'
  silentArgs     = '/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
