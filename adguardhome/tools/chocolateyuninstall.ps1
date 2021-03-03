$ErrorActionPreference = 'SilentlyContinue';
$binarypath = "$(Get-ToolsLocation)\\AdGuardHome"

adguardhome -s stop
adguardhome -s uninstall
Uninstall-BinFile -Name 'adguardhome'

try {
    Remove-Item $binarypath -recurse
} catch {
    Write-host("Package folder has already been removed by other means, skipping...")
}