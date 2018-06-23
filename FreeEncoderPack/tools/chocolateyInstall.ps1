$packageName = 'freeencoderpack'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ErrorActionPreference = 'Stop'
 
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe' 
  file          = Join-Path $toolsDir 'Free_Encoder_Pack_2018-05-22.exe'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs