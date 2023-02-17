$ErrorActionPreference = 'Stop'; # stop on all errors

$version  = $env:ChocolateyPackageVersion
$binarypath = "$(Get-ToolsLocation)\\UninstallTool"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  UnzipLocation  = $binarypath
  url            = 'https://github.com/crystalidea/uninstall-tool/releases/download/v3.7.2/uninstalltool_portable.zip'
  checksum       = '436aee1397c9650278a822e85f5a2810f898ec8d05b14a9680eea5c0a198402e'
  checksumtype   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$([Environment]::GetFolderPath('Desktop'))\\Uninstall Tool Portable.lnk" -TargetPath "$binarypath\\UninstallToolPortable.exe"
