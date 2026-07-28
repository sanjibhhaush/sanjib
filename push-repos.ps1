# push-repos.ps1
# Adds the GitHub remote and pushes each repo.
# Run from F:\games\FITLIX\github AFTER creating the repos on github.com.
#
# Usage (PowerShell):
#   .\push-repos.ps1 -Username YOUR-GITHUB-USERNAME
#
# Each repo must already exist on github.com as a PUBLIC repo with no README.

param(
    [Parameter(Mandatory = $true)]
    [string]$Username
)

$repos = @(
    "fitlix-storefront",
    "shopify-liquid-snippets",
    "css-component-library",
    "js-utils",
    "ai-prompt-library"
)

foreach ($repo in $repos) {
    if (-not (Test-Path $repo)) {
        Write-Host "SKIP: $repo not found" -ForegroundColor Yellow
        continue
    }

    Write-Host "`n=== Pushing $repo ===" -ForegroundColor Cyan
    Push-Location $repo

    # Replace the remote if it already exists
    git remote remove origin 2>$null
    git remote add origin "https://github.com/$Username/$repo.git"

    git push -u origin main

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Pushed: https://github.com/$Username/$repo" -ForegroundColor Green
    } else {
        Write-Host "Push failed for $repo. Does the repo exist on GitHub?" -ForegroundColor Red
    }

    Pop-Location
}

Write-Host "`nDone." -ForegroundColor Green
