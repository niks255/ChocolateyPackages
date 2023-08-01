$ErrorActionPreference = 'Stop'; # stop on all errors

$version  = $env:ChocolateyPackageVersion
$binarypath = "$(Get-ToolsLocation)\\UninstallTool"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  UnzipLocation  = $binarypath
  url            = 'https://github.com/crystalidea/uninstall-tool/releases/download/v3.7.3/uninstalltool_portable.zip'
  checksum       = '5c81fac52da5a89441adb425a62b7ace218e4312b7d474f4917c8ffa2abec1a5'
  checksumtype   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$([Environment]::GetFolderPath('Desktop'))\\Uninstall Tool Portable.lnk" -TargetPath "$binarypath\\UninstallToolPortable.exe"
