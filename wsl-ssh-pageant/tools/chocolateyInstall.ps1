$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  FileFullPath   = "$ScriptRoot\wsl-ssh-pageant.exe"
  url            = 'https://github.com/benpye/wsl-ssh-pageant/releases/download/20201121.2/wsl-ssh-pageant-386.exe'
  url64          = 'https://github.com/benpye/wsl-ssh-pageant/releases/download/20201121.2/wsl-ssh-pageant-amd64.exe'
  checksum       = '92d1aa69f0527b5048009e177bef9f6bd64cf70a2574f4907037d93d7c02060b'
  checksum64     = 'd2979bed31d7fe09fbd0186a45ae029e1311eb44cc432cb88d232fd3a4f4c1e0'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

Remove-Process -NameFilter 'wsl-ssh-pageant'
Get-ChocolateyWebFile @packageArgs
