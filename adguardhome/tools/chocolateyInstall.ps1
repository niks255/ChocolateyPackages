$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = "$(Get-ToolsLocation)"
    url            = 'https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.38/AdGuardHome_windows_386.zip'
    url64          = 'https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.38/AdGuardHome_windows_amd64.zip'
    checksum       = '1806b7b9898bd36991bd615e30bcfe53e2a84950f19b3f21af3adfb429645d4e'
    checksum64     = '01df05d3c2d1001ac65af23793e37d193e694b1b983aac9f4f6026187bf2e0d7'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Remove-Process -NameFilter 'AdGuardHome' -PathFilter 'AdGuardHome' | Out-Null
Install-ChocolateyZipPackage @packageArgs
Install-BinFile -Name 'adguardhome' -Path "$(Get-ToolsLocation)\\AdGuardHome\\AdGuardHome.exe"
