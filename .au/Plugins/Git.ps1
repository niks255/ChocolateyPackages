# Author: Miodrag Milic <miodrag.milic@gmail.com>
# Last Change: 09-Nov-2016.

# https://www.appveyor.com/docs/how-to/git-push/

param(
    $Info,

    # Branch name
    [string]$Branch = 'master'
)

[array]$packages = $Info.result.updated
if ($packages.Length -eq 0) { Write-Host "No package updated, skipping"; return }

Push-Location $au_Root

Write-Host "Checking out & resetting $Branch branch"
git checkout -q -B $Branch

Write-Host "Executing git pull"
git pull -q origin $Branch

Write-Host "Adding updated packages to git repository: $( $packages | % Name)"
$packages | ForEach-Object { git add $_.Path }
git status

Write-Host "Commiting"
$message = "AU: $($packages.Length) updated - $($packages | % Name)"
$gist_url = $Info.plugin_results.Gist -split '\n' | Select-Object -Last 1
$snippet_url = $Info.plugin_results.Snippet -split '\n' | Select-Object -Last 1
git commit -m "$message`n[skip ci] $gist_url $snippet_url" --allow-empty

Write-Host "Pushing changes"
git push -q origin $Branch

Pop-Location
