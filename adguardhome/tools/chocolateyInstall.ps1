$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = "$(Get-ToolsLocation)"
    url            = 'https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.54/AdGuardHome_windows_386.zip'
    url64          = 'https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.54/AdGuardHome_windows_amd64.zip'
    checksum       = 'b361eec25d8b7575f9cef31bf324661a155f0954698f3690cbe832dea0dcf5d3'
    checksum64     = 'c999d4b56c7db3578f0cac1712930ecdc3ccbf8a913d74387a89fbb0d0a4e007'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Remove-Process -NameFilter 'AdGuardHome' -PathFilter 'AdGuardHome' | Out-Null
Install-ChocolateyZipPackage @packageArgs
Install-BinFile -Name 'adguardhome' -Path "$(Get-ToolsLocation)\\AdGuardHome\\AdGuardHome.exe"
