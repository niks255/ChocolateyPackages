import-module au

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64\s*=\s*)('.*')"     = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_BeforeUpdate() {
     $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
     $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {
    $releases = 'https://api.github.com/repos/AdguardTeam/AdGuardHome/releases'
    $download_page = Invoke-WebRequest $releases | ConvertFrom-Json
    $tag = $download_page | Where prerelease -NotMatch 'true' | Select -ExpandProperty tag_name -First 1
    $links = $(Invoke-WebRequest "$releases/tags/$tag" | ConvertFrom-Json).assets

    @{
        URL32 = $($links -match 'windows_386').browser_download_url
        URL64 = $($links -match 'windows_amd64').browser_download_url
        Version = $tag -replace 'v'
    }
}

update -ChecksumFor none