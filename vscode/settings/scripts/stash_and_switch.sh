#!/bin/bash

# Check current branch
current_branch=$(git rev-parse --abbrev-ref HEAD)

if [ "$current_branch" != "main" ]; then
  echo "✅ You're on '$current_branch'. No need to stash."
  exit 0
fi

# Stash changes
echo "🚫 You're on 'main'. Stashing changes..."
git stash push -m "Auto-stash from main"

# List branches
echo "📂 Available branches:"
branches=$(git branch | grep -v 'main' | sed 's/*//g' | sed 's/ //g')
select target_branch in $branches; do
  if [ -n "$target_branch" ]; then
    echo "🔄 Switching to '$target_branch' and applying stash..."
    git checkout "$target_branch"
    git stash pop
    break
  else
    echo "❌ Invalid selection. Try again."
  fi
done
