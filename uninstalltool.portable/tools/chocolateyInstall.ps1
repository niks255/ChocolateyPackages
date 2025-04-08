$ErrorActionPreference = 'Stop'; # stop on all errors

$version  = $env:ChocolateyPackageVersion
$binarypath = "$(Get-ToolsLocation)\\UninstallTool"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  UnzipLocation  = $binarypath
  url            = 'https://github.com/crystalidea/uninstall-tool/releases/download/v3.7.4/uninstalltool_portable.zip'
  checksum       = '931db38559dafb4d7816f0ef5e2233c7b0a7a98228edf17dbd616badfa5595b7'
  checksumtype   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$([Environment]::GetFolderPath('Desktop'))\\Uninstall Tool Portable.lnk" -TargetPath "$binarypath\\UninstallToolPortable.exe"
