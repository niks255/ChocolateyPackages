$ErrorActionPreference = 'Stop';
 
$packageName = 'vkmessenger'

$key = Get-UninstallRegistryKey 'VK'
$file = $key.UninstallString

$installerType = 'exe'
$silentArgs = "/SILENT"
$validExitCodes = @(0)

if ($file -ne $null -and $file -ne '') {
    Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -SilentArgs $silentArgs -validExitCodes $validExitCodes -File $file
}