. $(Join-Path -Path "$(Split-Path -parent $PSScriptRoot)" -ChildPath 'common.ps1')

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"        = "`${1} $($Latest.URL32)"
          "(?i)(\s+x64:).*"        = "`${1} $($Latest.URL64)"
          "(?i)(checksum32:).*"    = "`${1} $($Latest.Checksum32)"
          "(?i)(checksum64:).*"    = "`${1} $($Latest.Checksum64)"
        }
    }
}

function global:au_BeforeUpdate { 
    Get-RemoteFiles -Purge -FileNameBase "$($Latest.PackageName)"
}

function global:au_GetLatest {
    Get-GithubRepoInfo -User 'librespeed' -Repo 'speedtest-cli'

    @{
        URL32 = $($links -match 'windows_386').browser_download_url
        URL64 = $($links -match 'windows_amd64').browser_download_url
        Version = $tag -replace 'v'
    }
}

update -ChecksumFor none