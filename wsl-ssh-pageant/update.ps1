import-module au

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
    Get-RemoteFiles -Purge -NoSuffix 
}


function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://api.github.com/repos/benpye/wsl-ssh-pageant/releases' | ConvertFrom-Json
    $version  = $download_page | Select-Object -ExpandProperty tag_name | Where-Object { $_.prerelease -NotMatch "true" } | Select -First 1

    @{
        URL32 = "https://github.com/benpye/wsl-ssh-pageant/releases/download/$version/wsl-ssh-pageant-386-gui.exe"
        URL64 = "https://github.com/benpye/wsl-ssh-pageant/releases/download/$version/wsl-ssh-pageant-amd64-gui.exe"
        Version = $version
    }
}

update -ChecksumFor none
