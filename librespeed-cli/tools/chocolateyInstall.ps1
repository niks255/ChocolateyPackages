$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = "$(Split-Path $MyInvocation.MyCommand.Definition)"
    url            = 'https://github.com/librespeed/speedtest-cli/releases/download/v1.0.9/librespeed-cli_1.0.9_windows_386.zip'
    url64          = 'https://github.com/librespeed/speedtest-cli/releases/download/v1.0.9/librespeed-cli_1.0.9_windows_amd64.zip'
    checksum       = 'd9af11c068d20f6c379c0b5b92c20ff0deda3092dc48dbb6789c8a09374ddf6f'
    checksum64     = '82838e03cb61eb12f4af5ed1140a62e800ba7848222a31d457a95760dd08ebf7'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
