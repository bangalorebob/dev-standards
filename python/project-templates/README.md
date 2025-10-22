# Python Project Template (Based on Wordle Solver)

## Recommended Structure
`
project-name/
├── .vscode/           # VS Code workspace settings
├── src/               # Source code
│   └── project_name/  # Main package
├── tests/             # Test files
├── docs/              # Documentation
├── .gitignore         # Git ignore rules
├── pyproject.toml     # Project configuration
├── requirements.txt   # Dependencies
├── requirements-dev.txt # Development dependencies
├── README.md          # Project documentation
├── dev.ps1           # Development helper script
└── setup_env.ps1     # Environment setup script
`

## Setup Instructions
1. Copy this template to new project directory
2. Rename 'project_name' to your actual project name
3. Run setup_env.ps1 to create virtual environment
4. Update pyproject.toml with your project details
5. Install Git hooks: .\git-hooks\install-protect-main.ps1
