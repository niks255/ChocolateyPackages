. $(Join-Path -Path "$(Split-Path -parent $PSScriptRoot)" -ChildPath 'common.ps1')

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://desktop.userapi.com/check_update?platform=win32&branch=master'
    $version  = $($download_page | ConvertFrom-Json).version

    @{
    	URL32 = 'https://desktop.userapi.com/win32/master/vk_setup.exe'
        URL64 = 'https://desktop.userapi.com/win64/master/vk_setup.exe'
        Version = $version
    }
}

update -ChecksumFor none -NoCheckChocoVersion