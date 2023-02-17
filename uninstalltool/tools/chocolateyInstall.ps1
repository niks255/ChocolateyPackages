$ErrorActionPreference = 'Stop'; 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = 'https://github.com/crystalidea/uninstall-tool/releases/download/v3.7.2/uninstalltool_setup.exe'
  checksum       = '4b9a27d7dee21b196401a16846b9a115665bdac4f9daad1be140f32daecfb5b1'
  checksumType   = 'sha256'
  silentArgs     = '/VERYSILENT /NORESTART /SP- /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
