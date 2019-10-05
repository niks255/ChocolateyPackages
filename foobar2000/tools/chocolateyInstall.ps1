$packageName = 'foobar2000'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ErrorActionPreference = 'Stop'
$pp                    = Get-PackageParameters
$shortcutName          = 'foobar2000.lnk'
$shortcut              = Join-Path ([Environment]::GetFolderPath("CommonDesktopDirectory")) $shortcutName
 
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe' 
  file          = Join-Path $toolsDir 'foobar2000.exe'
  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs

if ($pp['noicon']) {
	if (Test-Path $shortcut) {
		Remove-Item $shortcut
		Write-Host -ForegroundColor green 'Removed ' $shortcut
	} else {
		Write-Host -ForegroundColor yellow 'Did not find ' $shortcut
	}
}