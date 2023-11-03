$ErrorActionPreference = 'Stop'; 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = 'https://github.com/crystalidea/uninstall-tool/releases/download/v3.7.3/uninstalltool_setup.exe'
  checksum       = '2904050a27b48fe508e9f1ee04c55a4142689712a954f4c2005d2dc4fe3f1530'
  checksumType   = 'sha256'
  silentArgs     = '/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
