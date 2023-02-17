function global:au_BeforeUpdate() {
    Get-Item *.nupkg | Remove-Item
    if ($Latest.Url32 -ne $null) { $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32 }
    if ($Latest.Url64 -ne $null) { $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64 }
}

update -ChecksumFor none
