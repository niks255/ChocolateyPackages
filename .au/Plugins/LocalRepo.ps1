param(
    [string]$RepoPath = '',
    [switch]$RemoveOld = $true
)

if ($RepoPath -eq '') {
    Write-Host 'Repository path is mandatory!'
    Return
}

if (Test-Path -Path "$RepoPath") {
    $packages = Get-Item "$(Split-Path -parent $PSScriptRoot)/*.local";

    foreach ($package in $packages) {
        $newpkg = Get-Item "$package/*.nupkg"
        if ($newpkg) {
            if ($RemoveOld) {
                Get-Item "$RepoPath/*.nupkg" | Where-Object -Property Name -Like "$($package.Name)*" | Remove-Item;
            }
            Move-Item "$newpkg" "$RepoPath/";
        }
    }
} else {
    Write-Host "Repository path doesn't exist, skipping..."
}