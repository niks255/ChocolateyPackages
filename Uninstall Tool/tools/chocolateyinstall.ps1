$ErrorActionPreference = 'Stop'; 

$packageName = 'UninstallTool'
$url = 'https://www.crystalidea.com/downloads/uninstalltool_setup.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  checksum      = '2437759a22516dde78dd567ae31879819dc8032103c2daee94ec833d285f499e'
  checksumType  = 'sha256'
  silentArgs    = "/verysilent /norestart"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs