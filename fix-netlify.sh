#!/bin/bash
# Fix script for Netlify deploy failure
# Run this from the repo root: bash fix-netlify.sh

set -e

echo "=== Fixing Netlify deploy ==="

# 1. Remove broken worktree metadata
if [ -d ".git/worktrees/blissful-boyd" ]; then
    rm -rf .git/worktrees/blissful-boyd
    echo "✓ Removed broken worktree metadata"
else
    echo "✓ Worktree metadata already cleaned"
fi

# 2. Remove .claude from git tracking (if still tracked)
git rm --cached -r .claude 2>/dev/null && echo "✓ Removed .claude from git tracking" || echo "✓ .claude already untracked"

# 3. Remove local .claude directory
rm -rf .claude 2>/dev/null && echo "✓ Removed local .claude directory" || echo "✓ No local .claude directory"

# 4. Ensure .gitignore has .claude entry
if ! grep -q "^\.claude$" .gitignore 2>/dev/null; then
    echo ".claude" >> .gitignore
    echo "✓ Added .claude to .gitignore"
else
    echo "✓ .claude already in .gitignore"
fi

# 5. Stage, commit, and push
git add -A
git commit -m "Remove accidental .claude worktree/submodule reference and add .gitignore

Fixes Netlify deploy failure caused by a tracked .claude/worktrees path
that had no corresponding .gitmodules URL entry."

git push origin main

echo ""
echo "=== Done! Netlify should auto-redeploy. ==="

# Clean up this script
rm -- "$0"
