param([string[]] $Name, [string] $ForcedPackages, [string] $Root = $PSScriptRoot)

$AuDir = Join-Path -Path "${PSScriptRoot}" -ChildPath '.au'
import-module "$(Join-Path -Path $AuDir -ChildPath 'AU.psm1')"

$UpdateVars = Join-Path -Path "${PSScriptRoot}" -ChildPath 'update_vars.ps1'
if (Test-Path "$UpdateVars") { . "$UpdateVars" }

$Options = [ordered]@{
    WhatIf        = $au_WhatIf
    Force         = $false
    Timeout       = 300
    UpdateTimeout = 1200
    Threads       = 1
    Push          = $true
    PushAll       = $true
    IgnoreOn      = @(
      'Could not create SSL/TLS secure channel'
      'Could not establish trust relationship'
      'The operation has timed out'
      'Internal Server Error'
      'Service Temporarily Unavailable'
    )
    RepeatOn      = @(                                      #Error message parts on which to repeat package updater
      'Could not create SSL/TLS secure channel'             # https://github.com/chocolatey/chocolatey-coreteampackages/issues/718
      'Could not establish trust relationship'              # -||-
      'Unable to connect'
      'The remote name could not be resolved'
      'Choco pack failed with exit code 1'                  # https://github.com/chocolatey/chocolatey-coreteampackages/issues/721
      'The operation has timed out'
      'Internal Server Error'
      'An exception occurred during a WebClient request'
      'remote session failed with an unexpected state'
    )
    RepeatSleep   = 250                                    #How much to sleep between repeats in seconds, by default 0
    RepeatCount   = 2                                      #How many times to repeat on errors, by default 1

    Report = @{
        Type = 'markdown'                                   #Report type: markdown or text
        Path = "$(Join-Path -Path $PSScriptRoot -ChildPath Update-AUPackages.md)"         #Path where to save the report
        Params= @{                                          #Report parameters:
            Github_UserRepo = $Env:github_user_repo         #  Markdown: shows user info in upper right corner
            NoAppVeyor  = $true
            UserMessage = "[Ignored](#ignored) | [History](#update-history) | [Force Test](https://gist.github.com/$Env:gist_id_test) | [Releases](https://github.com/$Env:github_user_repo/tags)"       #  Markdown, Text: Custom user message to show
            NoIcons     = $false                            #  Markdown: don't show icon
            IconSize    = 32                                #  Markdown: icon size
            Title       = ''                                #  Markdown, Text: TItle of the report, by default 'Update-AUPackages'
        }
    }

    Git = @{
        Branch   = 'master'
    }

    ForcedPackages = $ForcedPackages -split ' '
    BeforeEach = {
        param($PackageName, $Options )

        $pattern = "^${PackageName}(?:\\(?<stream>[^:]+))?(?:\:(?<version>.+))?$"
        $p = $Options.ForcedPackages | ? { $_ -match $pattern }
        if (!$p) { return }

        $global:au_Force         = $true
        $global:au_IncludeStream = $Matches['stream']
        $global:au_Version       = $Matches['version']
    }
}

if ($ForcedPackages) { Write-Host "FORCED PACKAGES: $ForcedPackages" }
$global:au_Root         = $Root          #Path to the AU packages
$global:au_GalleryUrl   = ''             #URL to package gallery, leave empty for Chocolatey Gallery
$global:info = updateall -Name $Name -Options $Options
