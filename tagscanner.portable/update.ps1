import-module au

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://www.xdlab.ru/download.htm' -UseBasicParsing
    $version  = $($download_page.links | ? href -match 'tagscan.*\.zip$' | select -First 1 -expand href) -split '-' -replace '.zip' | Select -Last 1

    @{
        Version = $version
    }
}

update