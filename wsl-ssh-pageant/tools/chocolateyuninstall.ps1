$ErrorActionPreference = 'SilentlyContinue';

Get-Process -Name 'wsl-ssh-pageant' | Stop-Process -Force