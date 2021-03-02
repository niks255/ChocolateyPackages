$ErrorActionPreference = 'Stop';
 
$packageName = 'vkmessenger'

$key = Get-UninstallRegistryKey 'VK Messenger'
$file = $key.QuietUninstallString

$installerType = 'exe'
$silentArgs = "/SILENT"
$validExitCodes = @(0)

if ($file -ne $null -and $file -ne '') {
    Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -SilentArgs $silentArgs -validExitCodes $validExitCodes -File $file
}