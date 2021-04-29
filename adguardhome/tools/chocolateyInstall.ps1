$ErrorActionPreference = 'Stop';

$ToolsPath = Split-Path $MyInvocation.MyCommand.Definition
$File32 = "$ToolsPath\adguardhome_x32.zip"
$File64 = "$ToolsPath\adguardhome_x64.zip"

$packageArgs = @{
    PackageName    = $env:ChocolateyPackageName
    File           = "$File32"
    File64         = "$File64"
    Destination    = "$(Get-ToolsLocation)"
}

$service = Get-Service -DisplayName "AdGuard Home service" -ErrorAction SilentlyContinue

if ($service.Length -gt 0) {
    $service | Stop-Service
}

Get-ChocolateyUnzip @packageArgs
Remove-Item "$File32" -ea 0
Remove-Item "$File64" -ea 0

Install-BinFile -Name 'adguardhome' -Path "$(Get-ToolsLocation)\\AdGuardHome\\AdGuardHome.exe"

$service | Start-Service -ErrorAction SilentlyContinue
