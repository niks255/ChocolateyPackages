$ErrorActionPreference = 'SilentlyContinue';

Get-Process -Name 'wsl-ssh-pageant-386-gui', 'wsl-ssh-pageant-amd64-gui' | Stop-Process -Force
