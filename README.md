# Development Standards Repository

A comprehensive collection of proven development configurations, standards, and automation tools extracted from successful projects. This repository provides standardized setups for Git workflows, VS Code environments, Python projects, and development automation.

## 🎯 Purpose

This repository contains battle-tested configurations and standards that can be quickly applied to new projects to ensure:
- Consistent development environments
- Automated workflow enforcement  
- Best practice implementations
- Rapid project scaffolding

## 📁 Repository Structure

```
dev-standards/
├── git/                    # Git configuration and automation
│   ├── hooks/             # Pre-commit and other Git hooks
│   ├── gitignore/         # Language-specific .gitignore templates
│   └── scripts/           # Git workflow automation
├── vscode/                # VS Code configurations
│   ├── settings/          # Workspace and user settings
│   ├── launch/            # Debug configurations
│   └── extensions/        # Recommended extension lists
├── python/                # Python project standards
│   ├── templates/         # Project structure templates
│   ├── configs/           # pyproject.toml, requirements templates
│   └── scripts/           # Python automation tools
├── scripts/               # Cross-platform automation
│   ├── powershell/        # Windows PowerShell scripts
│   └── bash/              # Unix/Linux shell scripts
└── docs/                  # Documentation and guides
    ├── setup/             # Setup instructions
    └── guides/            # Best practice guides
```

## 🚀 Quick Start

### For New Projects

1. **Clone this repository:**
   ```bash
   git clone https://github.com/your-username/dev-standards.git
   cd dev-standards
   ```

2. **Run the appropriate setup script:**
   
   **Windows (PowerShell):**
   ```powershell
   .\scripts\powershell\setup-new-project.ps1 -ProjectPath "C:\path\to\new\project"
   ```
   
   **Unix/Linux:**
   ```bash
   ./scripts/bash/setup-new-project.sh /path/to/new/project
   ```

3. **Select components to install:**
   - Git hooks and configurations
   - VS Code settings and extensions
   - Python project templates
   - Development automation scripts

### For Existing Projects

Use the individual component installers in each directory to add specific standards to existing projects.

## 🔧 Key Components

### Git Standards
- **Pre-commit hooks** that prevent commits to main/master branches
- **Automated branch management** scripts
- **Standardized .gitignore** templates for various languages
- **Commit message** templates and enforcement

### VS Code Standards  
- **Workspace settings** for consistent formatting and linting
- **Debug configurations** for common project types
- **Extension recommendations** for optimal development experience
- **Task definitions** for build and development workflows

### Python Standards
- **Project templates** with modern Python structure
- **Configuration files** (pyproject.toml, requirements.txt)
- **Development scripts** for testing, linting, and packaging
- **Virtual environment** management automation

### Automation Scripts
- **Project setup** automation for rapid scaffolding
- **Configuration extraction** tools for capturing standards from existing projects
- **Cross-platform scripts** for Windows and Unix environments
- **Development workflow** automation

## 📖 Documentation

- [Setup Guide](docs/setup/README.md) - Detailed installation instructions
- [Git Hooks Guide](docs/guides/git-hooks.md) - Understanding and customizing Git hooks
- [VS Code Configuration](docs/guides/vscode-setup.md) - VS Code environment setup
- [Python Standards](docs/guides/python-standards.md) - Python project best practices

## 🤝 Contributing

This repository grows by capturing proven practices from successful projects. To contribute:

1. Extract working configurations from your projects
2. Document the standards and their benefits
3. Create automation scripts for easy application
4. Submit pull requests with improvements

## 📝 License

This repository contains configuration files and scripts intended for development use. Feel free to adapt and use these standards for your projects.

## 🏷️ Version

**Version:** 1.0.0  
**Last Updated:** January 2025  
**Source Project:** wordle_solver (proven production configurations)

---

**Note:** These standards are extracted from real, working projects and represent proven practices. They are designed to be immediately applicable and beneficial for development workflows.