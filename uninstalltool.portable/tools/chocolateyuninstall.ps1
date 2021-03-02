$ErrorActionPreference = 'Stop';
$binarypath = "$(Get-ToolsLocation)\\UninstallTool"

try {
    Remove-Item $binarypath -recurse
} catch {
    Write-host("Package folder has already been removed by other means, skipping...")
}

try {
    Remove-Item "$([Environment]::GetFolderPath('Desktop'))\\Uninstall Tool Portable.lnk"
} catch {
    Write-host("Desktop shortcut couldn't be removed, skipping...")
}