$ErrorActionPreference = 'Stop'; 

$packageName = 'UninstallTool'
$url = 'https://github.com/crystalidea/uninstall-tool/releases/download/v3.5.6/uninstalltool_setup.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  checksum      = '568ff214afcd75694e774c61a9b30b3a5e3b4350bba3dfd634ed7b663149f587'
  checksumType  = 'sha256'
  silentArgs    = "/verysilent /norestart"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs