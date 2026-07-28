# init-repos.ps1
# Initializes a git repository in each project folder and makes the first commit.
# Run from F:\games\FITLIX\github
#
# Usage (PowerShell):
#   .\init-repos.ps1
#
# This does NOT push to GitHub — you create the repos on github.com first,
# then run push-repos.ps1.

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

    Write-Host "`n=== $repo ===" -ForegroundColor Cyan
    Push-Location $repo

    if (Test-Path ".git") {
        Write-Host "Already a git repo, skipping init." -ForegroundColor Yellow
    } else {
        git init --quiet
        git add .
        git commit --quiet -m "Initial commit: $repo"
        git branch -M main
        Write-Host "Initialized and committed." -ForegroundColor Green
    }

    Pop-Location
}

Write-Host "`nAll repos initialized." -ForegroundColor Green
Write-Host "Next: create each repo on github.com (PUBLIC, no README), then run push-repos.ps1"
