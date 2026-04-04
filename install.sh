#!/bin/bash
set -e

SKILLS_DIR="$HOME/.claude/skills"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Web Design Agent — Installer ==="
echo ""

# Create skills directory
mkdir -p "$SKILLS_DIR"

# Initialize submodules if needed
echo "[1/3] Updating submodules..."
cd "$SCRIPT_DIR"
git submodule update --init --recursive 2>/dev/null || true

# Install external skills (from submodules)
echo "[2/3] Installing external skills..."
for skill_dir in "$SCRIPT_DIR"/skills/*/; do
    skill_name=$(basename "$skill_dir")

    # Find the SKILL.md (might be in different locations)
    skill_file=""
    if [ -f "$skill_dir/SKILL.md" ]; then
        skill_file="$skill_dir"
    elif [ -f "$skill_dir/.claude/skills/"*"/SKILL.md" ] 2>/dev/null; then
        skill_file=$(dirname "$skill_dir/.claude/skills/"*"/SKILL.md" | head -1)
    elif [ -d "$skill_dir/skills/" ]; then
        skill_file="$skill_dir/skills/"
    fi

    if [ -n "$skill_file" ]; then
        # Symlink the entire skill directory
        ln -sfn "$skill_file" "$SKILLS_DIR/$skill_name"
        echo "  ✓ $skill_name"
    else
        # Copy the entire skill dir as fallback
        ln -sfn "$skill_dir" "$SKILLS_DIR/$skill_name"
        echo "  ✓ $skill_name (full repo)"
    fi
done

# Install custom skills
echo "[3/3] Installing custom skills..."
for skill_dir in "$SCRIPT_DIR"/custom-skills/*/; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        ln -sfn "$skill_dir" "$SKILLS_DIR/$skill_name"
        echo "  ✓ $skill_name (custom)"
    fi
done

echo ""
echo "=== Done! ==="
echo "Installed to: $SKILLS_DIR"
echo ""
echo "Skills are now available globally in any Claude Code project."
echo "Run ./update.sh to pull latest versions."
