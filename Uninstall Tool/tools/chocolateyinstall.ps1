$ErrorActionPreference = 'Stop'; 

$packageName = 'UninstallTool'
$url = 'https://github.com/crystalidea/uninstall-tool/releases/download/v3.5.7/uninstalltool_setup.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  checksum      = '6AA7927BD9D605174156E6F28421D557FADD112523BC5BB04F2BB699A1D8223F'
  checksumType  = 'sha256'
  silentArgs    = "/verysilent /norestart"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs