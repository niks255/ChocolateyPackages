param(
    [string]$RepoPath = '',
    [switch]$RemoveOld = $true
)

if ($RepoPath -eq '') {
    Write-Host 'Repository path is mandatory!'
    Return
}

if (Test-Path -Path "$RepoPath") {
    $packages = Get-ChildItem -Recurse "${global:au_Root}" -Filter '*.nupkg';

    foreach ($package in $packages) {
        $PackageName = $package.Name -replace '.local.*.nupkg','.local'
        if ($RemoveOld) {
            Get-ChildItem "$RepoPath" -Filter "${PackageName}.*.nupkg" | Remove-Item -Force
        }
        Move-Item $package.FullName "${RepoPath}/";
    }
} else {
    Write-Host "Repository path doesn't exist, skipping..."
}