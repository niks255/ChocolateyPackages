$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  FileFullPath   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\wsl-ssh-pageant-gui.exe"
  url            = 'https://github.com/benpye/wsl-ssh-pageant/releases/download/20201121.2/wsl-ssh-pageant-386-gui.exe'
  url64          = 'https://github.com/benpye/wsl-ssh-pageant/releases/download/20201121.2/wsl-ssh-pageant-amd64-gui.exe'
  checksum       = '42156c97a60d30dee420efe5b2c353d8ac57ad88a08708abbead73745a7fd1b3'
  checksum64     = '8abd3945285cd08a704c9e1112a53b15f8da35d18c51b67385ae05de790af168'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

Remove-Process -NameFilter 'wsl-ssh-pageant-gui' | Out-Null
Get-ChocolateyWebFile @packageArgs
