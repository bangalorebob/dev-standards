# Setup Guide

This guide provides detailed instructions for setting up and using the development standards from this repository.

## Prerequisites

- Git installed and configured
- VS Code (for VS Code standards)
- Python 3.8+ (for Python standards)
- PowerShell 5.1+ (Windows) or Bash (Unix/Linux)

## Installation Methods

### Method 1: Full Project Setup (Recommended for new projects)

Use the automated setup scripts to configure a complete development environment:

**Windows:**
```powershell
# Clone the standards repository
git clone https://github.com/your-username/dev-standards.git

# Navigate to the repository
cd dev-standards

# Run the setup script for your new project
.\scripts\powershell\setup-new-project.ps1 -ProjectPath "C:\path\to\new\project" -ProjectType "python"
```

**Unix/Linux:**
```bash
# Clone the standards repository
git clone https://github.com/your-username/dev-standards.git

# Navigate to the repository
cd dev-standards

# Make scripts executable
chmod +x scripts/bash/*.sh

# Run the setup script for your new project
./scripts/bash/setup-new-project.sh /path/to/new/project python
```

### Method 2: Individual Component Installation

Install specific components as needed:

#### Git Hooks Installation
```bash
# Copy pre-commit hook to prevent main branch commits
cp git/hooks/pre-commit /path/to/project/.git/hooks/
chmod +x /path/to/project/.git/hooks/pre-commit
```

#### VS Code Configuration
```bash
# Copy VS Code workspace settings
mkdir -p /path/to/project/.vscode
cp vscode/settings/settings.json /path/to/project/.vscode/
cp vscode/launch/launch.json /path/to/project/.vscode/
cp vscode/extensions/extensions.json /path/to/project/.vscode/
```

#### Python Project Template
```bash
# Apply Python project structure
cp -r python/templates/basic-project/* /path/to/project/
cp python/configs/pyproject.toml /path/to/project/
```

## Configuration Options

### Git Hook Customization

Edit `git/hooks/pre-commit` to customize branch protection:

```bash
# Change protected branches
PROTECTED_BRANCHES="main master production"

# Customize error message
echo "🚫 Direct commits to $branch_name are not allowed!"
```

### VS Code Settings Customization

Modify `vscode/settings/settings.json` for your preferences:

```json
{
    "python.defaultInterpreterPath": "./venv/bin/python",
    "editor.formatOnSave": true,
    "editor.codeActionsOnSave": {
        "source.organizeImports": true
    }
}
```

### Python Configuration

Adjust `python/configs/pyproject.toml` for your project:

```toml
[project]
name = "your-project-name"
version = "0.1.0"
description = "Your project description"
```

## Verification

After installation, verify the setup:

### Test Git Hooks
```bash
# Try to commit directly to main (should be blocked)
git checkout main
git commit --allow-empty -m "test commit"
# Should show: "🚫 Direct commits to main are not allowed!"
```

### Test VS Code Setup
1. Open the project in VS Code
2. Check that extensions are recommended for installation
3. Verify that formatting and linting work correctly
4. Test debug configurations

### Test Python Environment
```bash
# Check that virtual environment is properly configured
python -m venv venv
source venv/bin/activate  # or venv\Scripts\activate on Windows
pip install -e .
```

## Troubleshooting

### Git Hooks Not Working
- Ensure hooks have execute permissions: `chmod +x .git/hooks/pre-commit`
- Check that the hook file has no file extension
- Verify the shebang line: `#!/bin/bash`

### VS Code Extensions Not Loading
- Open Command Palette (Ctrl+Shift+P)
- Run "Extensions: Show Recommended Extensions"
- Install recommended extensions manually if needed

### Python Environment Issues
- Ensure Python 3.8+ is installed
- Check virtual environment activation
- Verify pyproject.toml syntax with: `python -m pip install -e .`

## Advanced Usage

### Extracting Standards from Existing Projects

Use the extraction script to capture standards from your working projects:

```powershell
.\scripts\powershell\extract-standards.ps1 -SourcePath "C:\path\to\working\project" -OutputPath "C:\path\to\dev-standards"
```

### Creating Custom Templates

1. Create a new directory under the appropriate category
2. Add your configuration files
3. Update the setup scripts to include your template
4. Document the template in this guide

## Next Steps

- [Git Hooks Guide](../guides/git-hooks.md) - Learn about Git hook customization
- [VS Code Configuration](../guides/vscode-setup.md) - Advanced VS Code setup
- [Python Standards](../guides/python-standards.md) - Python best practices