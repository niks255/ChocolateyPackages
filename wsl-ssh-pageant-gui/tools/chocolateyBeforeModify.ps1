$ErrorActionPreference = 'SilentlyContinue';

Get-Process -Name 'wsl-ssh-pageant-gui' | Stop-Process -Force