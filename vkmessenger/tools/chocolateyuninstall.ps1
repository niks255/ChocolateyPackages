$ErrorActionPreference = 'Stop';

$key = Get-UninstallRegistryKey -SoftwareName 'VK Messenger*'

if ($key.Count -eq 1) {
    $key | ForEach-Object {
        $args = @{
          packageName    = $env:ChocolateyPackageName
          installerType  = 'exe'
          silentArgs     = "/SILENT"
          File           = $key.UninstallString
          validExitCodes = @(0)
        }

        Remove-Process -NameFilter 'VK' -PathFilter 'VK' | Out-Null
        Uninstall-ChocolateyPackage @args
    }
} elseif ($key.Count -eq 0) {
    Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
    Write-Warning "$key.Count matches found!"
    Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
    Write-Warning "Please alert package maintainer the following keys were matched:"
    $key | ForEach-Object {Write-Warning "- $_.DisplayName"}
}