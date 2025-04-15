$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = "$(Get-ToolsLocation)"
    url            = 'https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.60/AdGuardHome_windows_386.zip'
    url64          = 'https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.60/AdGuardHome_windows_amd64.zip'
    checksum       = '60eeb59c324d62938d302ab302cbe27328e2ef3f0d82c1400521dda15400dcb3'
    checksum64     = 'abbfb4ee532c27362cc69e844ba59ed9825a2bd72ae740faca412a3c85c29293'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Remove-Process -NameFilter 'AdGuardHome' -PathFilter 'AdGuardHome' | Out-Null
Install-ChocolateyZipPackage @packageArgs
Install-BinFile -Name 'adguardhome' -Path "$(Get-ToolsLocation)\\AdGuardHome\\AdGuardHome.exe"
