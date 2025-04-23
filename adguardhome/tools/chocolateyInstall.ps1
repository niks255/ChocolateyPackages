$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = "$(Get-ToolsLocation)"
    url            = 'https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.61/AdGuardHome_windows_386.zip'
    url64          = 'https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.61/AdGuardHome_windows_amd64.zip'
    checksum       = 'a70e441838d2f6fea81d38d4b27742f025bdaefc05b2b6f83c684b54d4e699b3'
    checksum64     = 'd28255353ace19aacbb01da94569b2582ecd9783121bab23e7fe7b72d657a4cc'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Remove-Process -NameFilter 'AdGuardHome' -PathFilter 'AdGuardHome' | Out-Null
Install-ChocolateyZipPackage @packageArgs
Install-BinFile -Name 'adguardhome' -Path "$(Get-ToolsLocation)\\AdGuardHome\\AdGuardHome.exe"
