# PowerShell script to build executable consistently
# Usage: .\build_exe.ps1

param(
    [switch]$Clean,
    [switch]$Debug,
    [string]$SpecFile = "wordle_solver.spec"
)

Write-Host "🔨 Building Wordle Solver executable..." -ForegroundColor Green

# Check if virtual environment exists
if (-not (Test-Path ".venv\Scripts\python.exe")) {
    Write-Error "❌ Virtual environment not found. Run .\setup_env.ps1 first."
    exit 1
}

# Clean build directories if requested
if ($Clean) {
    Write-Host "🧹 Cleaning build directories..." -ForegroundColor Yellow
    if (Test-Path "build") { Remove-Item -Recurse -Force "build" }
    if (Test-Path "dist") { Remove-Item -Recurse -Force "dist" }
}

# Build executable
Write-Host "🏗️ Building executable with PyInstaller..." -ForegroundColor Blue

$pyinstallerArgs = @("--noconfirm", $SpecFile)
if ($Debug) {
    $pyinstallerArgs += "--debug", "all"
}

& ".\.venv\Scripts\python.exe" -m PyInstaller @pyinstallerArgs

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Build completed successfully!" -ForegroundColor Green
    Write-Host "📦 Executable location: .\dist\wordle_solver\wordle_solver.exe" -ForegroundColor Cyan
    
    # Test the executable
    Write-Host "🧪 Testing executable..." -ForegroundColor Blue
    $testResult = & ".\dist\wordle_solver\wordle_solver.exe" --help 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Executable test passed!" -ForegroundColor Green
    } else {
        Write-Warning "⚠️ Executable test failed. Check the build."
    }
} else {
    Write-Error "❌ Build failed. Check the output above for errors."
    exit 1
}