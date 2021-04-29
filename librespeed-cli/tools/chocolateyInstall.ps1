$ErrorActionPreference = 'Stop';

$ToolsPath = Split-Path $MyInvocation.MyCommand.Definition
$File32 = "$ToolsPath\librespeed-cli_x32.zip"
$File64 = "$ToolsPath\librespeed-cli_x64.zip"

$packageArgs = @{
    PackageName    = $env:ChocolateyPackageName
    File           = "$File32"
    File64         = "$File64"
    Destination    = "$ToolsPath"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item "$File32" -ea 0
Remove-Item "$File64" -ea 0