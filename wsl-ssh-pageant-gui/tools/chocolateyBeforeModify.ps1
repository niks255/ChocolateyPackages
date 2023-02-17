$ErrorActionPreference = 'Stop';

Remove-Process -NameFilter 'wsl-ssh-pageant-gui' | Out-Null