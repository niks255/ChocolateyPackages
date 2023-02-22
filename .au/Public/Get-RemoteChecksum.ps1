# Author: Miodrag Milic <miodrag.milic@gmail.com>
# Last Change: 26-Nov-2016.

<#
.SYNOPSIS
    Download file from internet and calculate its checksum

#>
function Get-RemoteChecksum( [string] $Url, $Algorithm='sha256', $Headers ) {
    $TempFile = [System.IO.Path]::GetTempFileName()
    if ($Env:au_tempdir) {
        New-Item -Type Directory -Force -ea 0 $Env:au_tempdir | Out-Null
        $Name = (Get-Item $TempFile).Name
        Remove-Item $TempFile -ea ignore
        $TempFile = Join-Path -Path $Env:au_tempdir -ChildPath $Name
    }
    Invoke-WebRequest $Url -OutFile $TempFile -UseBasicParsing -Headers $Headers
    $res = Get-FileHash $TempFile -Algorithm $Algorithm | ForEach-Object Hash
    Remove-Item $TempFile -ea ignore
    return $res.ToLower()
}

