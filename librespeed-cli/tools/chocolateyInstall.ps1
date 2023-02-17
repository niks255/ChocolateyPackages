$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = "$(Split-Path $MyInvocation.MyCommand.Definition)"
    url            = 'https://github.com/librespeed/speedtest-cli/releases/download/v1.0.10/librespeed-cli_1.0.10_windows_386.zip'
    url64          = 'https://github.com/librespeed/speedtest-cli/releases/download/v1.0.10/librespeed-cli_1.0.10_windows_amd64.zip'
    checksum       = '05b660c7e509904f11c204373da2e37fe1742de72d8db60a4aa1f72fc4d1074c'
    checksum64     = 'a0bca0add2a6d08a03838821fb2a6bce9156ae38c98ab1d2c15f1fc7cdf52ee9'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
