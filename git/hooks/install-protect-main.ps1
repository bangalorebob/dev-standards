# PowerShell installer for pre-commit hook that protects main branch
#
# Usage: .\git-hooks\install-protect-main.ps1
# 
# Run this from your repository root directory

param(
    [switch]$Force,
    [switch]$Help
)

if ($Help) {
    Write-Host "Pre-Commit Hook Installer" -ForegroundColor Green
    Write-Host "========================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Usage: .\git-hooks\install-protect-main.ps1 [-Force]" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Options:" -ForegroundColor Yellow
    Write-Host "  -Force    Overwrite existing pre-commit hook without backup"
    Write-Host "  -Help     Show this help message"
    Write-Host ""
    Write-Host "This installs a Git pre-commit hook that prevents direct commits to main branch."
    exit 0
}

try {
    # Check if we're in a git repository
    $gitRoot = git rev-parse --show-toplevel 2>$null
    if (-not $gitRoot) {
        throw "Not in a Git repository"
    }
    
    $repoRoot = Get-Location
    $hooksDir = Join-Path $repoRoot ".git\hooks"
    $sourceHook = Join-Path $repoRoot "git-hooks\pre-commit-protect-main"
    $targetHook = Join-Path $hooksDir "pre-commit"
    
    Write-Host "🔧 Installing pre-commit hook to protect main branch..." -ForegroundColor Blue
    
    # Check if source hook exists
    if (-not (Test-Path $sourceHook)) {
        throw "Source hook not found at $sourceHook. Make sure you're running this from the repository root."
    }
    
    # Handle existing hook
    if (Test-Path $targetHook) {
        if ($Force) {
            Write-Host "⚠️  Overwriting existing pre-commit hook..." -ForegroundColor Yellow
            Remove-Item $targetHook -Force
        } else {
            $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
            $backupPath = "$targetHook.backup.$timestamp"
            Write-Host "📦 Backing up existing pre-commit hook to $(Split-Path $backupPath -Leaf)..." -ForegroundColor Gray
            Move-Item $targetHook $backupPath
        }
    }
    
    # Copy hook
    Write-Host "📋 Copying hook..." -ForegroundColor Gray
    Copy-Item $sourceHook $targetHook
    
    Write-Host "✅ Pre-commit hook installed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "🔒 Main branch is now protected from direct commits." -ForegroundColor Cyan
    Write-Host ""
    Write-Host "To test the protection:" -ForegroundColor Yellow
    Write-Host "  git checkout main" -ForegroundColor White
    Write-Host "  git commit --allow-empty -m 'test commit'" -ForegroundColor White
    Write-Host "  # Should be blocked with error message" -ForegroundColor Gray
    Write-Host ""
    Write-Host "To use feature branches (recommended workflow):" -ForegroundColor Yellow
    Write-Host "  git checkout -b feature/my-feature" -ForegroundColor White
    Write-Host "  # Make changes, then:" -ForegroundColor Gray
    Write-Host "  git add ." -ForegroundColor White
    Write-Host "  git commit -m 'My feature changes'" -ForegroundColor White
    Write-Host ""
    Write-Host "To bypass in emergencies only:" -ForegroundColor Yellow
    Write-Host "  git commit --no-verify -m 'emergency commit'" -ForegroundColor White
    
} catch {
    Write-Host "❌ Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}