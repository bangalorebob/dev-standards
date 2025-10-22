# PowerShell script for common development tasks
# Usage: .\dev.ps1 <command>

param(
    [string]$Command = "help"
)

function Show-Help {
    Write-Host "🛠️  Wordle Solver Development Helper" -ForegroundColor Green
    Write-Host "Usage: .\dev.ps1 <command>" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Available commands:" -ForegroundColor Yellow
    Write-Host "  setup       - Set up development environment"
    Write-Host "  setup-clean - Clean setup (remove .venv first)"
    Write-Host "  check       - Validate environment"
    Write-Host "  run         - Run the solver"
    Write-Host "  build       - Build executable"
    Write-Host "  build-clean - Clean build (remove build/dist first)"
    Write-Host "  test        - Run tests"
    Write-Host "  freeze      - Update requirements-frozen.txt"
    Write-Host "  clean       - Clean all generated files"
    Write-Host "  help        - Show this help"
}

function Invoke-Setup {
    param([switch]$Clean)
    if ($Clean) {
        .\setup_env.ps1 -Clean -Dev
    } else {
        .\setup_env.ps1 -Dev
    }
}

function Invoke-Check {
    & ".\.venv\Scripts\python.exe" check_env.py
}

function Invoke-Run {
    & ".\.venv\Scripts\python.exe" src\run.py
}

function Invoke-Build {
    param([switch]$Clean)
    if ($Clean) {
        .\build_exe.ps1 -Clean
    } else {
        .\build_exe.ps1
    }
}

function Invoke-Test {
    if (Test-Path ".venv\Scripts\pytest.exe") {
        & ".\.venv\Scripts\pytest.exe" tests/ -v
    } else {
        Write-Host "⚠️  pytest not installed. Run: .\dev.ps1 setup" -ForegroundColor Yellow
    }
}

function Invoke-Freeze {
    Write-Host "📦 Updating requirements-frozen.txt..." -ForegroundColor Blue
    & ".\.venv\Scripts\python.exe" -m pip freeze > requirements-frozen.txt
    Write-Host "✅ Updated requirements-frozen.txt" -ForegroundColor Green
}

function Invoke-Clean {
    Write-Host "🧹 Cleaning generated files..." -ForegroundColor Yellow
    
    $pathsToClean = @(
        "build",
        "dist",
        "__pycache__",
        "src\__pycache__",
        "src\wordle_solver\__pycache__",
        "tests\__pycache__",
        "*.egg-info"
    )
    
    foreach ($path in $pathsToClean) {
        if (Test-Path $path) {
            Remove-Item -Recurse -Force $path
            Write-Host "Removed: $path" -ForegroundColor Gray
        }
    }
    
    Write-Host "✅ Clean complete!" -ForegroundColor Green
}

# Main command dispatcher
switch ($Command.ToLower()) {
    "setup" { Invoke-Setup }
    "setup-clean" { Invoke-Setup -Clean }
    "check" { Invoke-Check }
    "run" { Invoke-Run }
    "build" { Invoke-Build }
    "build-clean" { Invoke-Build -Clean }
    "test" { Invoke-Test }
    "freeze" { Invoke-Freeze }
    "clean" { Invoke-Clean }
    "help" { Show-Help }
    default { 
        Write-Host "❌ Unknown command: $Command" -ForegroundColor Red
        Show-Help 
    }
}