. $(Join-Path -Path "$(Split-Path -parent $PSScriptRoot)" -ChildPath 'common.ps1')

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64\s*=\s*)('.*')"     = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $page  = Invoke-WebRequest -Uri 'https://vk.me/app' -UseBasicParsing
    $url64 = $page.Links -match '.*.exe' | Select -Expand href
    Get-ExeFileVersion -URL $url64

    @{
        URL64 = "$url64"
        Version = "$version"
    }
}

. $(Join-Path -Path "$(Split-Path -parent $PSScriptRoot)" -ChildPath 'update_common.ps1')
