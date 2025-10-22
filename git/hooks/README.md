# Git Hooks Collection

This directory contains reusable Git hooks for maintaining code quality and enforcing workflows.

## Available Hooks

### pre-commit-protect-main
**Purpose:** Prevents direct commits to the main branch, enforcing feature branch workflow.

**Features:**
- Blocks commits to `main` branch
- Provides helpful error messages with suggested workflow
- Includes emergency bypass option
- Extensible to protect other branches (develop, production, etc.)

**Installation:**
```bash
# Copy to your repository
cp git-hooks/pre-commit-protect-main .git/hooks/pre-commit

# Make executable (Unix/Linux/macOS)
chmod +x .git/hooks/pre-commit

# On Windows with Git Bash
chmod +x .git/hooks/pre-commit
```

**Quick Install Script:**
```bash
# Run from repository root
./git-hooks/install-protect-main.sh
```

## Usage

### Normal Workflow (Recommended)
```bash
# Create feature branch
git checkout -b feature/my-new-feature

# Make your changes
git add .
git commit -m "Add new feature"  # ✅ Allowed

# Push and create PR
git push -u origin feature/my-new-feature
```

### Emergency Bypass (Use Sparingly)
```bash
# Only for true emergencies
git commit --no-verify -m "hotfix: critical security patch"
```

## Customization

### Protect Additional Branches
Edit the hook file and uncomment/modify this section:
```bash
if [ "$branch" = "develop" ] || [ "$branch" = "production" ]; then
  echo "🚫 Direct commits to '$branch' are not allowed."
  exit 1
fi
```

### Custom Branch Names
Modify the branch check logic:
```bash
# Example: protect 'master' instead of 'main'
if [ "$branch" = "master" ]; then
```

### Different Error Messages
Customize the echo statements to match your team's workflow.

## Benefits

✅ **Prevents Accidents** - No more accidental commits to main  
✅ **Enforces Process** - Ensures all changes go through proper review  
✅ **Team Consistency** - Everyone follows the same workflow  
✅ **Easy Setup** - Simple installation across multiple repositories  
✅ **Flexible** - Can bypass for emergencies, extend for other branches  

## Troubleshooting

### Hook Not Running
- Check file permissions: `ls -la .git/hooks/pre-commit`
- Ensure executable: `chmod +x .git/hooks/pre-commit`
- Verify path: Hook should be exactly `.git/hooks/pre-commit` (no extension)

### Hook Running But Not Working
- Test the script: `.git/hooks/pre-commit`
- Check Git bash availability on Windows
- Verify branch name detection: `git rev-parse --abbrev-ref HEAD`

### Need to Disable Temporarily
```bash
# Rename to disable
mv .git/hooks/pre-commit .git/hooks/pre-commit.disabled

# Restore later
mv .git/hooks/pre-commit.disabled .git/hooks/pre-commit
```