#!/bin/bash
# Install The Algorithm skill pack for Claude Code
set -e

SKILLS_DIR="${HOME}/.claude/skills"
REPO_DIR="${SKILLS_DIR}/thealgorithm"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$SKILLS_DIR"

# If repo isn't in the skills directory yet, symlink it
if [ ! -d "$REPO_DIR" ] && [ ! -L "$REPO_DIR" ]; then
  ln -s "$SCRIPT_DIR" "$REPO_DIR"
  echo "  Linked repo to $REPO_DIR"
fi

# Create symlinks for each skill
for skill in algorithm question delete simplify accelerate automate score; do
  target="${SKILLS_DIR}/${skill}"
  if [ -L "$target" ]; then
    rm "$target"
  fi
  ln -s "thealgorithm/${skill}" "$target"
  echo "  Linked /$(basename "$target")"
done

echo ""
echo "The Algorithm installed. Available skills:"
echo "  /algorithm  — Full 5-step run"
echo "  /question   — Step 1: Question every requirement"
echo "  /delete     — Step 2: Delete every possible step"
echo "  /simplify   — Step 3: Simplify and optimize"
echo "  /accelerate — Step 4: Accelerate cycle time"
echo "  /automate   — Step 5: Automate"
echo "  /score      — Quick diagnostic scorecard"
echo ""
echo "Start a new Claude Code session to use them."
