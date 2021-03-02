$ErrorActionPreference = 'Stop';
 
$packageName = 'UninstallTool'

$key = Get-UninstallRegistryKey 'Uninstall Tool'
$file = $key.UninstallString

$installerType = 'exe'
$silentArgs = "/SILENT"
$validExitCodes = @(0)

if ($file -ne $null -and $file -ne '') {
    Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -SilentArgs $silentArgs -validExitCodes $validExitCodes -File $file
}