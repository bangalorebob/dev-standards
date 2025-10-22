#!/usr/bin/env python3
"""
Python environment validation script for Wordle Solver.
Run this to check if your Python environment is properly configured.
"""

import sys
import subprocess
import importlib
from pathlib import Path

# Required Python version
MIN_PYTHON_VERSION = (3, 8)
RECOMMENDED_PYTHON_VERSION = (3, 11)

# Required packages
REQUIRED_PACKAGES = [
    "rich",
]

BUILD_PACKAGES = [
    "pyinstaller",
]

def check_python_version():
    """Check if Python version meets requirements."""
    current_version = sys.version_info[:2]
    
    print(f"🐍 Python Version: {sys.version.split()[0]}")
    
    if current_version < MIN_PYTHON_VERSION:
        print(f"❌ Python {'.'.join(map(str, MIN_PYTHON_VERSION))} or later required!")
        return False
    elif current_version < RECOMMENDED_PYTHON_VERSION:
        print(f"⚠️  Python {'.'.join(map(str, RECOMMENDED_PYTHON_VERSION))} recommended for best compatibility")
        return True
    else:
        print("✅ Python version is good!")
        return True

def check_virtual_environment():
    """Check if running in a virtual environment."""
    in_venv = hasattr(sys, 'real_prefix') or (
        hasattr(sys, 'base_prefix') and sys.base_prefix != sys.prefix
    )
    
    if in_venv:
        print("✅ Running in virtual environment")
        print(f"   Environment path: {sys.prefix}")
        return True
    else:
        print("⚠️  Not running in virtual environment (recommended)")
        return False

def check_package(package_name, required=True):
    """Check if a package is installed."""
    try:
        # Special handling for PyInstaller
        if package_name == "pyinstaller":
            import PyInstaller
        else:
            importlib.import_module(package_name)
        print(f"✅ {package_name} is installed")
        return True
    except ImportError:
        if required:
            print(f"❌ {package_name} is missing (required)")
        else:
            print(f"⚠️  {package_name} is missing (optional)")
        return False

def check_project_structure():
    """Check if project structure is correct."""
    required_files = [
        "src/run.py",
        "src/wordle_solver/__init__.py",
        "wordle_solver.spec",
        "requirements.txt",
    ]
    
    all_good = True
    for file_path in required_files:
        if Path(file_path).exists():
            print(f"✅ {file_path} exists")
        else:
            print(f"❌ {file_path} is missing")
            all_good = False
    
    return all_good

def get_pip_list():
    """Get list of installed packages."""
    try:
        result = subprocess.run([sys.executable, "-m", "pip", "list"], 
                              capture_output=True, text=True, check=True)
        return result.stdout
    except subprocess.CalledProcessError:
        return "Could not get pip list"

def main():
    """Main validation function."""
    print("🔍 Wordle Solver Environment Validation")
    print("=" * 50)
    
    # Check Python version
    python_ok = check_python_version()
    print()
    
    # Check virtual environment
    check_virtual_environment()
    print()
    
    # Check project structure
    print("📁 Project Structure:")
    structure_ok = check_project_structure()
    print()
    
    # Check required packages
    print("📦 Required Packages:")
    packages_ok = all(check_package(pkg) for pkg in REQUIRED_PACKAGES)
    print()
    
    # Check build packages
    print("🔨 Build Packages:")
    build_ok = all(check_package(pkg, required=False) for pkg in BUILD_PACKAGES)
    print()
    
    # Overall status
    print("📋 Summary:")
    if python_ok and structure_ok and packages_ok:
        print("✅ Environment is ready for development!")
        if build_ok:
            print("✅ Build tools are available!")
        else:
            print("⚠️  Install build dependencies: pip install -r requirements-dev.txt")
    else:
        print("❌ Environment needs attention. See issues above.")
        print("💡 Try running: .\\setup_env.ps1")
    
    print()
    print("🔧 Installed Packages:")
    print(get_pip_list())

if __name__ == "__main__":
    main()