. $(Join-Path -Path "$(Split-Path -parent $PSScriptRoot)" -ChildPath 'common.ps1')

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"         = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64\s*=\s*)('.*')"       = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"    = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"  = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    Get-GithubRepoInfo -User 'benpye' -Repo 'wsl-ssh-pageant'

    @{
        URL32 = $($links -match '386' -notmatch 'gui').browser_download_url
        URL64 = $($links -match 'amd64' -notmatch 'gui').browser_download_url
        Version = $tag
    }
}

update -ChecksumFor none
