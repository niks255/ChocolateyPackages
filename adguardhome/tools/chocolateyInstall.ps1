$ErrorActionPreference = 'Stop';

$version  = $env:ChocolateyPackageVersion
$binarypath = "$(Get-ToolsLocation)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  UnzipLocation  = $binarypath
  url            = 'https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.105.1/AdGuardHome_windows_386.zip'
  url64          = 'https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.105.1/AdGuardHome_windows_amd64.zip'
  checksum       = '40d6efaedbb5f95c257a156e8890b340a50097ed2f5cd07086a8bf271ba6a2bf'
  checksum64     = '151b6d63499d19edc15971bd2971de6e899fd2476658930ab5572877135d7003'
  checksumtype   = 'sha256'
  checksumtype64 = $checksumtype
}

$service = Get-Service -DisplayName "AdGuard Home service" -ErrorAction SilentlyContinue

if ($service.Length -gt 0) {
    $service | Stop-Service
}

Install-ChocolateyZipPackage @packageArgs
Install-BinFile -Name 'adguardhome' -Path "$binarypath\\AdGuardHome\\AdGuardHome.exe"

$service | Start-Service -ErrorAction SilentlyContinue
