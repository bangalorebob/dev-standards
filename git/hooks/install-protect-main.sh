#!/bin/bash
# Quick installer for pre-commit hook that protects main branch
#
# Usage: ./git-hooks/install-protect-main.sh
# 
# Run this from your repository root directory

set -e  # Exit on any error

REPO_ROOT="$(git rev-parse --show-toplevel)"
HOOKS_DIR="$REPO_ROOT/.git/hooks"
SOURCE_HOOK="$REPO_ROOT/git-hooks/pre-commit-protect-main"
TARGET_HOOK="$HOOKS_DIR/pre-commit"

echo "🔧 Installing pre-commit hook to protect main branch..."

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Error: Not in a Git repository"
    exit 1
fi

# Check if source hook exists
if [ ! -f "$SOURCE_HOOK" ]; then
    echo "❌ Error: Source hook not found at $SOURCE_HOOK"
    echo "Make sure you're running this from the repository root"
    exit 1
fi

# Backup existing pre-commit hook if it exists
if [ -f "$TARGET_HOOK" ]; then
    echo "📦 Backing up existing pre-commit hook..."
    mv "$TARGET_HOOK" "$TARGET_HOOK.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Copy and make executable
echo "📋 Copying hook..."
cp "$SOURCE_HOOK" "$TARGET_HOOK"

echo "🔑 Making hook executable..."
chmod +x "$TARGET_HOOK"

echo "✅ Pre-commit hook installed successfully!"
echo ""
echo "🔒 Main branch is now protected from direct commits."
echo ""
echo "To test the protection:"
echo "  git checkout main"
echo "  git commit --allow-empty -m 'test commit'"
echo "  # Should be blocked with error message"
echo ""
echo "To use feature branches (recommended workflow):"
echo "  git checkout -b feature/my-feature"
echo "  # Make changes, then:"
echo "  git add ."
echo "  git commit -m 'My feature changes'"
echo ""
echo "To bypass in emergencies only:"
echo "  git commit --no-verify -m 'emergency commit'"