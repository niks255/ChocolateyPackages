import-module au

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64\s*=\s*)('.*')"     = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_BeforeUpdate() {
     $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://api.github.com/repos/crystalidea/uninstall-tool/releases/latest' | ConvertFrom-Json
    $version  = $download_page | Select-Object -ExpandProperty name | Where-Object { $_.prerelease -NotMatch "true" } | Select -First 1

    @{
        URL32 = "https://github.com/crystalidea/uninstall-tool/releases/download/v$version/uninstalltool_setup.exe"
        Version = $version
    }
}

update -ChecksumFor none