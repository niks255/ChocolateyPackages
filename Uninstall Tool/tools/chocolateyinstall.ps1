$ErrorActionPreference = 'Stop'; 

$packageName = 'UninstallTool'
$url = 'https://github.com/crystalidea/uninstall-tool/releases/download/v3.5.5/uninstalltool_setup.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  checksum      = '3d57a1fbc5236d1e7105de54a1a2e0531c2a2a07188df05583f9ccdd6819bfa0'
  checksumType  = 'sha256'
  silentArgs    = "/verysilent /norestart"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs