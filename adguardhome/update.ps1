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

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://api.github.com/repos/AdguardTeam/AdGuardHome/releases/latest'
    $version  = $($download_page | ConvertFrom-Json).tag_name -replace 'v'

    @{
        URL32 = $($download_page | ConvertFrom-Json).assets.browser_download_url -match 'AdGuardHome_windows_386.zip'
        URL64 = $($download_page | ConvertFrom-Json).assets.browser_download_url -match 'AdGuardHome_windows_amd64.zip'
        Version = $version
    }
}

update