# Development Standards Repository

A comprehensive collection of proven development configurations, standards, and automation tools extracted from successful projects. This repository provides standardized setups for Git workflows, VS Code environments, Python projects, web application development, and development automation.

## 🎯 Purpose

This repository contains battle-tested configurations and standards that can be quickly applied to new projects to ensure:
- Consistent development environments
- Automated workflow enforcement
- Best practice implementations
- Rapid project scaffolding
- **Web application deployment patterns**
- **Multi-platform deployment support**

## 📁 Repository Structure

```
dev-standards/
├── git/                    # Git configuration and automation
│   ├── hooks/             # Pre-commit and other Git hooks
│   │   ├── install-web-hooks.ps1      # 🆕 Web app git hooks installer
│   │   └── pre-commit-web-app         # 🆕 Web app branch protection
│   ├── gitignore/         # Language-specific .gitignore templates
│   └── scripts/           # Git workflow automation
├── vscode/                # VS Code configurations
│   ├── settings/          # Workspace and user settings
│   ├── launch/            # Debug configurations
│   └── extensions/        # Recommended extension lists
├── python/                # Python project standards
│   ├── templates/         # Project structure templates
│   ├── configs/           # pyproject.toml, requirements templates
│   ├── scripts/           # Python automation tools
│   └── web-frameworks/    # 🆕 Web framework templates
│       └── flask/         # 🆕 Flask application templates
│           ├── app-template.py           # 🆕 Flask app with context processors
│           ├── requirements-web.txt      # 🆕 Multi-platform web dependencies
│           ├── Procfile.template         # 🆕 Render deployment config
│           ├── wsgi-template.py          # 🆕 PythonAnywhere WSGI config
│           └── templates/               # 🆕 Jinja2 template collection
│               ├── base.html.template    # 🆕 Base template with Bootstrap
│               └── home.html.template    # 🆕 Home page template
├── scripts/               # Cross-platform automation
│   ├── powershell/        # Windows PowerShell scripts
│   └── bash/              # Unix/Linux shell scripts
└── docs/                  # Documentation and guides
    ├── setup/             # Setup instructions
    └── guides/            # Best practice guides
```

## 🚀 Quick Start

### For New Web Applications

1. **Clone this repository:**
   ```bash
   git clone https://github.com/your-username/dev-standards.git
   cd dev-standards
   ```

2. **Set up Flask project with enhanced standards:**
   ```powershell
   # Copy Flask templates to your new project
   cp python/web-frameworks/flask/* /path/to/your/project/

   # Install enhanced git hooks
   cd /path/to/your/project
   /path/to/dev-standards/git/hooks/install-web-hooks.ps1
   ```

3. **Deploy to multiple platforms:**
   - **Render:** Uses `Procfile.template` and `requirements-web.txt`
   - **PythonAnywhere:** Uses `wsgi-template.py` and proven WSGI patterns
   - **Local Development:** Enhanced Flask app with context processors

### For New Projects

1. **Run the appropriate setup script:**

   **Windows (PowerShell):**
   ```powershell
   .\scripts\powershell\setup-new-project.ps1 -ProjectPath "C:\path\to\new\project"
   ```

   **Unix/Linux:**
   ```bash
   ./scripts/bash/setup-new-project.sh /path/to/new/project
   ```

2. **Select components to install:**
   - Git hooks and configurations
   - VS Code settings and extensions
   - Python project templates
   - **Web application templates (Flask)**
   - Development automation scripts

### For Existing Projects

Use the individual component installers in each directory to add specific standards to existing projects.

## 🔧 Key Components

### 🆕 **Enhanced Web Application Standards**
- **Flask Templates** with proven context processor patterns
- **Multi-platform Deployment** configurations (Render + PythonAnywhere)
- **Protected Branch Workflows** for web application development
- **Jinja2 Templates** with Bootstrap integration and template inheritance
- **Production-Ready** WSGI configurations

### Git Standards
- **Enhanced pre-commit hooks** for web applications protecting main, deployment, staging, and production branches
- **PowerShell installer** with backup functionality for existing hooks
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
- **🆕 Web framework templates** with Flask patterns
- **Configuration files** (pyproject.toml, requirements.txt)
- **🆕 Multi-platform deployment** requirements and configurations
- **Development scripts** for testing, linting, and packaging
- **Virtual environment** management automation

### Automation Scripts
- **Project setup** automation for rapid scaffolding
- **🆕 Web application setup** with enhanced git hooks
- **Configuration extraction** tools for capturing standards from existing projects
- **Cross-platform scripts** for Windows and Unix environments
- **Development workflow** automation

## 🌐 Web Application Features

### Flask Templates
- **Context Processors:** Automatic phase information injection
- **Template Inheritance:** Base template with Bootstrap 5.3.3
- **Multi-platform Ready:** Tested on Render and PythonAnywhere
- **Production Patterns:** Based on successful flask-lab implementation

### Enhanced Git Hooks
- **Branch Protection:** Prevents direct commits to main, deployment, staging, production
- **Helpful Guidance:** Provides clear workflow instructions
- **Emergency Bypass:** `--no-verify` option for critical fixes
- **Easy Installation:** PowerShell script with backup functionality

### Deployment Configurations
- **Render:** `Procfile.template` with Gunicorn configuration
- **PythonAnywhere:** `wsgi-template.py` with proper path handling
- **Dependencies:** `requirements-web.txt` with proven Flask stack

## 📖 Documentation

- [Setup Guide](docs/setup/README.md) - Detailed installation instructions
- [Git Hooks Guide](docs/guides/git-hooks.md) - Understanding and customizing Git hooks
- [VS Code Configuration](docs/guides/vscode-setup.md) - VS Code environment setup
- [Python Standards](docs/guides/python-standards.md) - Python project best practices
- **🆕 [Flask Web Applications](docs/guides/flask-standards.md)** - Web application development patterns

## 🎯 Proven Success Patterns

These standards are extracted from real, successful deployments:

### **flask-lab Project Success** ✅
- **Phase 2b:** Jinja2 templates with context processors
- **Multi-platform:** Successfully deployed to Render and PythonAnywhere
- **Template Inheritance:** Proven base template patterns
- **Branch Protection:** Enhanced git hooks preventing main branch commits
- **Production Ready:** Battle-tested WSGI and deployment configurations

### **Development Workflow** ✅
- **Feature Branches:** Enforced through git hooks
- **Multi-platform Testing:** Configurations tested on multiple hosting platforms
- **Context Processor Patterns:** Automatic phase information injection
- **Template Standards:** Bootstrap integration with responsive design

## 🤝 Contributing

This repository grows by capturing proven practices from successful projects. To contribute:

1. Extract working configurations from your projects
2. Document the standards and their benefits
3. Create automation scripts for easy application
4. **Test on multiple platforms** before submitting
5. Submit pull requests with improvements

## 📝 License

This repository contains configuration files and scripts intended for development use. Feel free to adapt and use these standards for your projects.

## 🏷️ Version

**Version:** 2.0.0
**Last Updated:** October 2025
**Source Projects:**
- **wordle_solver** (proven production configurations)
- **🆕 flask-lab** (web application patterns, multi-platform deployment)

**Recent Enhancements:**
- ✅ Flask web application templates with context processors
- ✅ Multi-platform deployment configurations (Render + PythonAnywhere)
- ✅ Enhanced git hooks for web application branch protection
- ✅ Jinja2 templates with Bootstrap integration
- ✅ Production-ready WSGI configurations

---

**Note:** These standards are extracted from real, working projects and represent proven practices. The web application templates are based on successful flask-lab Phase 2b deployment to multiple platforms. They are designed to be immediately applicable and beneficial for development workflows.
