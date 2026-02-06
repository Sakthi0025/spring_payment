Write-Host "=== Create Feature Branch (from master) ===" -ForegroundColor Cyan

# Ask for ticket
$ticket = Read-Host "Enter ticket ID (ex: PAY-123)"
$desc   = Read-Host "Enter short description (ex: payment-api)"

if (-not $ticket -or -not $desc) {
    Write-Host "Ticket and description are required." -ForegroundColor Red
    exit 1
}

# Generate branch name
$branch = ("feature/{0}-{1}" -f $ticket, $desc).ToLower().Replace(" ", "-")

Write-Host "Branch to be created: $branch" -ForegroundColor Yellow

# Fetch latest changes
git fetch origin

# Checkout master (READ ONLY BASE)
git checkout master
git pull origin master

# Create feature branch
git checkout -b $branch

Write-Host "Feature branch created locally: $branch" -ForegroundColor Green

Write-Host "NOTE: Branch NOT pushed to origin (manual push only)"