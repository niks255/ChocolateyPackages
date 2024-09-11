$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    UnzipLocation  = "$(Split-Path $MyInvocation.MyCommand.Definition)"
    url            = 'https://github.com/librespeed/speedtest-cli/releases/download/v1.0.11/librespeed-cli_1.0.11_windows_386.zip'
    url64          = 'https://github.com/librespeed/speedtest-cli/releases/download/v1.0.11/librespeed-cli_1.0.11_windows_amd64.zip'
    checksum       = 'a8a70b140a95f633d10aa229901738fab0c83fe4ebd23dfd464bf8c1041fde67'
    checksum64     = '86bd49d59ea8c249d029cafcf6c1af266076db335e5e7a35baa940c3d14d21f7'
    checksumtype   = 'sha256'
    checksumtype64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
