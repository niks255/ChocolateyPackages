﻿$ErrorActionPreference = 'Stop';

Remove-Process -NameFilter 'wsl-ssh-pageant' | Out-Null
