$ErrorActionPreference = 'Stop';
 
$packageName = 'foobar2000'

$key = Get-UninstallRegistryKey $packageName
$file = $key.InstallLocation + '\' + 'uninstall.exe'

$installerType = 'exe'
$silentArgs = '/S'
$validExitCodes = @(0)

if ($file -ne $null -and $file -ne '') {
    Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -SilentArgs $silentArgs -validExitCodes $validExitCodes -File $file
}