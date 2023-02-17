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
    $url32 = 'https://desktop.userapi.com/win32/master/vk_setup.exe'
    $url64 = 'https://desktop.userapi.com/win64/master/vk_setup.exe'

    Get-ExeFileVersion -Url "$url32"
    $lastModified = (Invoke-WebRequest -Uri "$url32" -Method HEAD).Headers['Last-Modified']
    $updated = New-Object DateTime
    [DateTime]::TryParse($lastModified, [ref]$updated) | Out-Null

    @{
    	URL32 = "$url32"
        URL64 = "$url64"
        Version = "$($version).$($updated.ToString("yyyyMd"))"
    }
}

. $(Join-Path -Path "$(Split-Path -parent $PSScriptRoot)" -ChildPath 'update_common.ps1')
