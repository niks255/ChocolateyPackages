import-module au

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

function global:au_BeforeUpdate() {
     $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
     $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://api.github.com/repos/benpye/wsl-ssh-pageant/releases' | ConvertFrom-Json
    $version  = $download_page | Select-Object -ExpandProperty tag_name | Where-Object { $_.prerelease -NotMatch "true" } | Select -First 1

    @{
        URL32 = "https://github.com/benpye/wsl-ssh-pageant/releases/download/$version/wsl-ssh-pageant-386.exe"
        URL64 = "https://github.com/benpye/wsl-ssh-pageant/releases/download/$version/wsl-ssh-pageant-amd64.exe"
        Version = $version
    }
}

update -ChecksumFor none
