$ErrorActionPreference = 'Stop'; # stop on all errors

$version  = $env:ChocolateyPackageVersion
$binarypath = "$(Get-ToolsLocation)\\UninstallTool"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  UnzipLocation  = $binarypath
  url            = 'https://github.com/crystalidea/uninstall-tool/releases/download/v3.5.10/uninstalltool_portable.zip'
  checksum       = '845d79c1f099aa8b4e81a73148dda56a94534a0d249c0063f53d77a040f774b7'
  checksumtype   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$([Environment]::GetFolderPath('Desktop'))\\Uninstall Tool Portable.lnk" -TargetPath "$binarypath\\UninstallToolPortable.exe"
