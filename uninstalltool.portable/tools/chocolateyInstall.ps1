$ErrorActionPreference = 'Stop'; # stop on all errors

$version  = $env:ChocolateyPackageVersion
$binarypath = "$(Get-ToolsLocation)\\UninstallTool"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  UnzipLocation  = $binarypath
  url            = 'https://github.com/crystalidea/uninstall-tool/releases/download/v3.7.3/uninstalltool_portable.zip'
  checksum       = '855cadd9de770007364a2adcc963b23b7ea998fd0dbda4cc5b5179bf4578f2f2'
  checksumtype   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$([Environment]::GetFolderPath('Desktop'))\\Uninstall Tool Portable.lnk" -TargetPath "$binarypath\\UninstallToolPortable.exe"
