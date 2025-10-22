# PowerShell installer for web application git hooks
# Based on successful flask-lab implementation

param(
    [switch]$Force,
    [switch]$Help
)

if ($Help) {
    Write-Host "Web Application Git Hooks Installer" -ForegroundColor Green
    Write-Host "====================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Usage: .\git\hooks\install-web-hooks.ps1 [-Force]" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "This installs Git hooks that protect main, deployment, staging, and production branches."
    Write-Host "Based on proven flask-lab implementation."
    exit 0
}

try {
    $repoRoot = Get-Location
    $hooksDir = Join-Path $repoRoot ".git\hooks"
    $targetHook = Join-Path $hooksDir "pre-commit"

    Write-Host "🔧 Installing web application git hooks..." -ForegroundColor Blue

    # Handle existing hook
    if (Test-Path $targetHook) {
        if ($Force) {
            Write-Host "⚠️  Overwriting existing pre-commit hook..." -ForegroundColor Yellow
            Remove-Item $targetHook -Force
        } else {
            $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
            $backupPath = "$targetHook.backup.$timestamp"
            Write-Host "📦 Backing up existing hook..." -ForegroundColor Gray
            Move-Item $targetHook $backupPath
        }
    }

    # Get the hook content from dev-standards
    $scriptPath = $PSScriptRoot
    $sourceHook = Join-Path $scriptPath "pre-commit-web-app"

    if (Test-Path $sourceHook) {
        Copy-Item $sourceHook $targetHook
    } else {
        Write-Host "❌ Source hook not found at $sourceHook" -ForegroundColor Red
        exit 1
    }

    Write-Host "✅ Web application git hooks installed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "🔒 Protected branches: main, deployment, staging, production" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Recommended workflow:" -ForegroundColor Yellow
    Write-Host "  git checkout -b feature/your-feature-name" -ForegroundColor White
    Write-Host "  # Make changes, then:" -ForegroundColor Gray
    Write-Host "  git add ." -ForegroundColor White
    Write-Host "  git commit -m 'Add new feature'" -ForegroundColor White

} catch {
    Write-Host "❌ Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
