. $(Join-Path -Path "$(Split-Path -parent $PSScriptRoot)" -ChildPath 'common.ps1')

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    Get-GithubRepoInfo -User 'crystalidea' -Repo 'uninstall-tool'

    @{
        URL32 = $($links -match 'setup').browser_download_url
        Version = $tag -replace 'v'
    }
}

update -ChecksumFor none