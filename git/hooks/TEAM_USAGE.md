# Git Hooks Collection for Team Workflows

A collection of reusable Git hooks to enforce good development practices and maintain code quality across repositories.

## Quick Start

### Install Main Branch Protection
```bash
# Clone or copy the git-hooks folder to your repository
# Then run the installer:

# Linux/macOS/Git Bash
./git-hooks/install-protect-main.sh

# Windows PowerShell
.\git-hooks\install-protect-main.ps1
```

## What's Included

### 🔒 Main Branch Protection
- **File:** `pre-commit-protect-main`
- **Purpose:** Prevents accidental direct commits to main branch
- **Benefits:** Enforces feature branch workflow, prevents main branch corruption

### 📋 Easy Installation
- **Bash Script:** `install-protect-main.sh` (Cross-platform)
- **PowerShell Script:** `install-protect-main.ps1` (Windows-optimized)
- **Automatic backup** of existing hooks

## Usage Examples

### For New Repository
```bash
# Copy git-hooks folder to your new repo
cp -r /path/to/git-hooks .

# Install protection
./git-hooks/install-protect-main.sh

# Test it works
git checkout main
git commit --allow-empty -m "test"  # Should be blocked
```

### For Existing Repository
```bash
# Add git-hooks folder to existing repo
git submodule add https://github.com/yourusername/git-hooks.git

# Or just copy the folder
cp -r git-hooks /path/to/existing/repo/

# Install
cd /path/to/existing/repo
./git-hooks/install-protect-main.sh
```

### For Team Distribution
1. **Add to template:** Include in your repository template
2. **Document in README:** Add installation instructions
3. **Onboarding:** Include in developer setup guide
4. **CI/CD:** Verify hooks are installed in build pipeline

## Customization

### Protect Additional Branches
Edit `pre-commit-protect-main` and uncomment:
```bash
if [ "$branch" = "develop" ] || [ "$branch" = "production" ]; then
  echo "🚫 Direct commits to '$branch' are not allowed."
  exit 1
fi
```

### Team-Specific Messages
Customize error messages to match your workflow:
```bash
echo "Please use our feature branch workflow:"
echo "  git checkout -b JIRA-123/feature-description"
```

### Different Protected Branches
```bash
# Protect 'master' instead of 'main'
if [ "$branch" = "master" ]; then
```

## Advanced Usage

### Multiple Hooks
Combine with other hooks by chaining them:
```bash
# In pre-commit
./git-hooks/pre-commit-protect-main
./git-hooks/pre-commit-lint-check
./git-hooks/pre-commit-test-runner
```

### Repository Template
Include in your organization's repository template:
```
your-org-template/
├── .github/
├── git-hooks/          # ← Include this folder
├── README.md
└── other-template-files
```

### Automated Installation
Add to your setup scripts:
```bash
# In setup.sh or onboarding script
if [ -d "git-hooks" ]; then
    echo "Installing Git hooks..."
    ./git-hooks/install-protect-main.sh
fi
```

## Troubleshooting

### Common Issues
1. **Permission denied:** Run `chmod +x .git/hooks/pre-commit`
2. **Hook not running:** Check file path (no `.sample` extension)
3. **Wrong branch name:** Verify your default branch name (main vs master)

### Testing
```bash
# Test hook is working
git checkout main
git commit --allow-empty -m "test commit"
# Should see: "🚫 Direct commits to 'main' are not allowed."

# Test bypass works
git commit --no-verify --allow-empty -m "emergency test"
# Should succeed (use sparingly!)
```

### Debugging
```bash
# Run hook manually
.git/hooks/pre-commit

# Check branch detection
git rev-parse --abbrev-ref HEAD

# Verify hook is executable
ls -la .git/hooks/pre-commit
```

## Benefits for Teams

✅ **Consistent Workflow** - Everyone follows the same process  
✅ **Reduced Mistakes** - Prevents accidental main branch commits  
✅ **Easy Adoption** - Simple installation across repositories  
✅ **Flexible** - Customizable for different team needs  
✅ **Emergency Ready** - Bypass option for critical situations  
✅ **Self-Documenting** - Clear error messages guide developers  

## Contributing

To extend this collection:
1. Create new hook files with descriptive names
2. Add installation scripts
3. Update documentation
4. Test across different environments
5. Consider Windows/Unix compatibility

## License

These hooks are provided as-is for educational and professional use. Customize freely for your organization's needs.