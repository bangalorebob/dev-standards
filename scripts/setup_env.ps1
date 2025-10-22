# PowerShell script to set up Python environment consistently
# Usage: .\setup_env.ps1

param(
    [switch]$Clean,
    [switch]$Dev,
    [string]$PythonVersion = "3.11"
)

Write-Host "🐍 Setting up Python environment for Wordle Solver..." -ForegroundColor Green

# Check if Python is available
try {
    $pythonCmd = Get-Command python -ErrorAction Stop
    $currentVersion = & python --version
    Write-Host "✅ Found Python: $currentVersion" -ForegroundColor Green
} catch {
    Write-Error "❌ Python not found in PATH. Please install Python $PythonVersion or later."
    exit 1
}

# Clean existing virtual environment if requested
if ($Clean -and (Test-Path ".venv")) {
    Write-Host "🧹 Cleaning existing virtual environment..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force ".venv"
}

# Create virtual environment if it doesn't exist
if (-not (Test-Path ".venv")) {
    Write-Host "📦 Creating virtual environment..." -ForegroundColor Blue
    python -m venv .venv
}

# Activate virtual environment
Write-Host "🔌 Activating virtual environment..." -ForegroundColor Blue
& ".\.venv\Scripts\Activate.ps1"

# Upgrade pip
Write-Host "⬆️ Upgrading pip..." -ForegroundColor Blue
& ".\.venv\Scripts\python.exe" -m pip install --upgrade pip setuptools wheel

# Install dependencies
if ($Dev) {
    Write-Host "🛠️ Installing development dependencies..." -ForegroundColor Blue
    & ".\.venv\Scripts\python.exe" -m pip install -r requirements-dev.txt
} else {
    Write-Host "📚 Installing production dependencies..." -ForegroundColor Blue
    & ".\.venv\Scripts\python.exe" -m pip install -r requirements.txt
}

# Install project in editable mode
Write-Host "🔧 Installing project in editable mode..." -ForegroundColor Blue
& ".\.venv\Scripts\python.exe" -m pip install -e .

Write-Host "✅ Environment setup complete!" -ForegroundColor Green
Write-Host "To activate the environment manually, run: .\.venv\Scripts\Activate.ps1" -ForegroundColor Cyan
Write-Host "To build executable, run: .\build_exe.ps1" -ForegroundColor Cyan