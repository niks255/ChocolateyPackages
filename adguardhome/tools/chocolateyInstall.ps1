$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = "$(Get-ToolsLocation)"
    url            = 'https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.28/AdGuardHome_windows_386.zip'
    url64          = 'https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.28/AdGuardHome_windows_amd64.zip'
    checksum       = '921505c88ba4f3fa305d3975f6c10edba8c2c28f5dee151ed18c91b5231aad78'
    checksum64     = 'dd34d15cb265fb4d7842b7c8e4b3f6d57ce4ec8ec98ed0c1b81dd7ecdc581908'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Remove-Process -NameFilter 'AdGuardHome' -PathFilter 'AdGuardHome' | Out-Null
Install-ChocolateyZipPackage @packageArgs
Install-BinFile -Name 'adguardhome' -Path "$(Get-ToolsLocation)\\AdGuardHome\\AdGuardHome.exe"
