$ErrorActionPreference = 'Stop';

$ToolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = "$ToolsPath"
    url            = 'https://github.com/librespeed/speedtest-cli/releases/download/v1.0.8/librespeed-cli_1.0.8_windows_386.zip'
    url64          = 'https://github.com/librespeed/speedtest-cli/releases/download/v1.0.8/librespeed-cli_1.0.8_windows_amd64.zip'
    checksum       = 'b760539d7927b140af173e05e2ca2d534705158282065a8730ad1fa9b2fc0f4b'
    checksum64     = '3b28996d49610a3e3d0c66694a32df49625352e2c7833b93a04679db3af9f471'
    checksumtype   = 'sha256'
    checksumtype64 = $checksumtype
}


Install-ChocolateyZipPackage @packageArgs
