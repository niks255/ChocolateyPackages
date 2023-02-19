$UserAgent='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.5304.88 Safari/537.36'

$AuDir = Join-Path -Path "${PSScriptRoot}" -ChildPath '.au'
import-module "$(Join-Path -Path "${AuDir}" -ChildPath 'AU.psm1')"

$UpdateVars = Join-Path -Path "${PSScriptRoot}" -ChildPath 'update_vars.ps1'
if (Test-Path "$UpdateVars") { . "$UpdateVars" }

function CustDownload {
    Param
    (
         [Parameter(Mandatory=$true, Position=0)]
         [string] $Url,
         [Parameter(Mandatory=$true, Position=1)]
         [string] $OutFile,
         [Parameter(Mandatory=$false, Position=2)]
         [string] $Referer,
         [Parameter(Mandatory=$false, Position=3)]
         [bool] $Extract = $false,
         [Parameter(Mandatory=$false, Position=4)]
         [string] $ExtractPath
    )

    $TempFile = Get-TempFile
    $downloader = New-Object System.Net.WebClient
    $downloader.Headers['User-Agent'] = $UserAgent

    if ($Referer) {
        $downloader.Headers['Referer'] = "$Referer"
    }

    $downloader.DownloadFile("$Url", "$OutFile")
    if ([System.IO.File]::Exists("$TempFile")) {
        if ($Extract) {
            New-Item -ItemType Directory -Force -Path "$ExtractPath" | Out-Null
            Expand-Archive -Path "$TempFile" -Destination "$ExtractPath"
        }
        Remove-Item "$TempFile" -Force -ErrorAction Ignore
    }
}

function global:Get-WebdavPage {
    Param (
         [Parameter(Mandatory=$true, Position=0)]
         [string] $Location
    )

    $global:page = "${Env:webdav_page}/$([System.Web.HttpUtility]::UrlEncode($location))"
}

function Get-TempFile {
    $TempFile = [System.IO.Path]::GetTempFileName()
    if ($Env:au_tempdir) {
        $Name = (Get-Item $TempFile).Name
        $TempFile = Join-Path -Path $Env:au_tempdir -ChildPath $Name
    }
    $TempFile
}

function global:Get-GithubRepoInfo {
    Param (
         [Parameter(Mandatory=$true, Position=0)]
         [string] $User,
         [Parameter(Mandatory=$true, Position=1)]
         [string] $Repository
    )
    $AuthString = "{0}:{1}" -f $env:GithubUsername,$env:GithubToken
    $Credentials = [Convert]::ToBase64String([System.Text.Encoding]::Ascii.GetBytes($AuthString))
    $global:releases = "https://api.github.com/repos/$User/$Repository/releases/latest"
    $global:download_page = Invoke-WebRequest $releases  -Headers @{"Authorization"="Basic $Credentials"} | ConvertFrom-Json
    $global:tag = $download_page.tag_name
    $global:links = $download_page.assets
}

function global:Get-ExeFileVersion {
    Param (
        [Parameter(Mandatory=$true)]
        [String]$URL,
        [Parameter(Mandatory=$false)]
        [string]$Referer = 'none'
    )

    $TempFile = Get-TempFile
    $downloader = New-Object System.Net.WebClient
    $downloader.Headers['User-Agent'] = $UserAgent;

    if ($Referer) {
        $downloader.Headers['Referer'] = "$Referer"
    }

    $downloader.DownloadFile("$URL", "$TempFile")

    # Windows can do this
    if ($IsWindows) {
        $global:version = ([System.Diagnostics.FileVersionInfo]::GetVersionInfo("$TempFile").ProductVersion).Trim()
    }

    # Let's use exiftool here
    if ($IsLinux) {
        $exiftool = "$(Get-Command 'exiftool')"
        if ($exiftool) {
            $global:version = (exiftool -s -s -s -ProductVersion "$TempFile").Trim()
        }
    }
    
    Remove-Item "$TempFile" -Force
}

Function Get-RedirectedUrl {
    Param (
        [Parameter(Mandatory=$true)]
        [String]$URL
    )

    $request = Invoke-WebRequest -Method Head -Uri $URL
    if ($request.BaseResponse.RequestMessage.RequestUri -ne $null) {
        return $request.BaseResponse.RequestMessage.RequestUri.AbsoluteUri
    }
}
