#!/usr/bin/env bash
#
# Export The Algorithm skills for use in AI tools.
#
# Usage:
#   ./export.sh              # Generate dist/the-algorithm.md (universal, any AI tool)
#   ./export.sh --claude     # Export all skills to ./export/ (Claude Code web UI format)
#   ./export.sh --bundle     # Bundle all steps into one Claude Code skill
#   ./export.sh question     # Export a single skill (Claude Code format)
#
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
EXPORT_DIR="$REPO_DIR/export"
SKILL_DIRS=(question delete simplify accelerate automate score algorithm)

# ── helpers ──────────────────────────────────────────────────────────────────

rewrite_skill_refs() {
  # Rewrites /skill references to plain-language step names.
  # Reads from stdin, writes to stdout.
  sed \
    -e 's|`/question`|Step 1 (Question Every Requirement)|g' \
    -e 's|`/delete`|Step 2 (Delete Every Possible Step)|g' \
    -e 's|`/simplify`|Step 3 (Simplify and Optimize)|g' \
    -e 's|`/accelerate`|Step 4 (Accelerate Cycle Time)|g' \
    -e 's|`/automate`|Step 5 (Automate)|g' \
    -e 's|`/algorithm`|the full five-step Algorithm|g' \
    -e 's|`/score`|the Quick Diagnostic scorecard|g' \
    -e 's|\/question`|Step 1 (Question Every Requirement)`|g' \
    -e 's|\/delete`|Step 2 (Delete Every Possible Step)`|g' \
    -e 's|\/simplify`|Step 3 (Simplify and Optimize)`|g' \
    -e 's|\/accelerate`|Step 4 (Accelerate Cycle Time)`|g' \
    -e 's|\/automate`|Step 5 (Automate)`|g' \
    -e 's|\/algorithm`|the full five-step Algorithm`|g' \
    -e 's|\/score`|the Quick Diagnostic scorecard`|g' \
  | sed \
    -e 's| /question | Step 1 (Question) |g' \
    -e 's| /delete | Step 2 (Delete) |g' \
    -e 's| /simplify | Step 3 (Simplify) |g' \
    -e 's| /accelerate | Step 4 (Accelerate) |g' \
    -e 's| /automate | Step 5 (Automate) |g' \
    -e 's| /algorithm | the full Algorithm |g' \
    -e 's| /score | the Quick Diagnostic |g'
}

extract_body() {
  # Extract everything after the second --- (YAML frontmatter closing)
  awk '
    /^---$/ { count++; if (count == 2) { skip=1; next } }
    skip { print }
  ' "$1"
}

strip_frontmatter() {
  # Reads a SKILL.md, rewrites frontmatter to web UI format (name + description only),
  # and adjusts skill cross-references to be descriptive.
  local input="$1"

  # Extract name and description from frontmatter
  local name description body
  name=$(awk '/^---$/ { block++; next } block == 1 && /^name:/ { sub(/^name: */, ""); print }' "$input")
  # Description may be multi-line (YAML literal block scalar)
  description=$(awk '
    /^---$/ { block++; next }
    block == 1 && /^description:/ {
      # Check for literal/folded block scalar
      if ($0 ~ /\|/ || $0 ~ />/) { in_desc=1; next }
      # Inline value
      sub(/^description: */, ""); print; next
    }
    block == 1 && in_desc && /^  / { sub(/^  /, ""); print; next }
    block == 1 && in_desc { in_desc=0 }
  ' "$input")

  # Extract body (everything after second ---)
  body=$(awk '
    /^---$/ { count++; if (count == 2) { skip=1; next } }
    skip { print }
  ' "$input")

  # Rewrite /skill references to be descriptive for web UI
  body=$(echo "$body" | rewrite_skill_refs)

  # Emit web UI formatted SKILL.md
  cat <<EOF
---
name: $name
description: |
$(echo "$description" | sed 's/^/  /')
---
$body
EOF
}

export_skill() {
  local skill_name="$1"
  local src="$REPO_DIR/$skill_name/SKILL.md"
  local dest_dir="$EXPORT_DIR/$skill_name"

  if [[ ! -f "$src" ]]; then
    echo "  ⚠ Skipping $skill_name — no SKILL.md found"
    return
  fi

  mkdir -p "$dest_dir"
  strip_frontmatter "$src" > "$dest_dir/SKILL.md"
  echo "  ✓ $skill_name → export/$skill_name/SKILL.md"
}

export_root_skill() {
  # The root SKILL.md is the orchestrator — export it as 'thealgorithm'
  local src="$REPO_DIR/SKILL.md"
  local dest_dir="$EXPORT_DIR/thealgorithm"

  mkdir -p "$dest_dir"
  strip_frontmatter "$src" > "$dest_dir/SKILL.md"
  echo "  ✓ thealgorithm → export/thealgorithm/SKILL.md"
}

bundle_all() {
  # Bundle all skills into a single SKILL.md for web UI upload
  local dest_dir="$EXPORT_DIR/thealgorithm-bundle"
  mkdir -p "$dest_dir"

  # Start with root skill description
  local root_desc
  root_desc=$(awk '
    /^---$/ { block++; next }
    block == 1 && /^description:/ {
      if ($0 ~ /\|/ || $0 ~ />/) { in_desc=1; next }
      sub(/^description: */, ""); print; next
    }
    block == 1 && in_desc && /^  / { sub(/^  /, ""); print; next }
    block == 1 && in_desc { in_desc=0 }
  ' "$REPO_DIR/SKILL.md")

  {
    cat <<HEADER
---
name: thealgorithm
description: |
$(echo "$root_desc" | sed 's/^/  /')
---

# The Algorithm

Five steps. In order. Every time.

1. **Question every requirement.** Each should come with a name attached. If you can't say who required it and why, it's suspect.
2. **Delete every possible step.** If you're not adding back 10% of what you deleted, you didn't delete enough.
3. **Simplify and optimize.** But not before steps 1 and 2. The most common mistake smart people make is optimizing something that should not exist.
4. **Accelerate cycle time.** But not before step 3. Don't speed up a bad process.
5. **Automate.** But not before step 4. Don't automate waste.

## The Cardinal Rule

The steps are sequential. Never optimize before deleting. Never automate before simplifying. If someone jumps ahead, pull them back. The discipline IS the method.

## Tone

- Direct. Concrete. No jargon.
- Name specific things. "Your onboarding flow has 7 steps" not "the user experience could be streamlined."
- Ask "why" before "how."
- Challenge politely but relentlessly.
- Prefer one hard question over three soft suggestions.
- Output structured artifacts, not essays.

---

HEADER

    # Append each step skill's body
    for skill in "${SKILL_DIRS[@]}"; do
      local src="$REPO_DIR/$skill/SKILL.md"
      [[ -f "$src" ]] || continue

      # Extract body after frontmatter and rewrite /skill references
      extract_body "$src" | rewrite_skill_refs

      echo ""
      echo "---"
      echo ""
    done
  } > "$dest_dir/SKILL.md"

  echo "  ✓ bundle → export/thealgorithm-bundle/SKILL.md"
}

build_universal() {
  # Build a single universal file for use with any AI tool.
  # No YAML frontmatter, no Claude Code-specific language.
  local dist_dir="$REPO_DIR/dist"
  mkdir -p "$dist_dir"

  {
    cat <<'PREAMBLE'
# The Algorithm

You are an AI assistant that applies The Algorithm — a five-step framework for optimizing any process, product, or system. Based on the framework from Jon McNeill's book "The Algorithm", used at Tesla, SpaceX, Lyft, and companies of every size.

When the user asks you to optimize, simplify, challenge, or improve something, apply these five steps in order. The discipline IS the method — never skip ahead.

## The Five Steps

Five steps. In order. Every time.

1. **Question every requirement.** Each should come with a name attached. If you can't say who required it and why, it's suspect.
2. **Delete every possible step.** If you're not adding back 10% of what you deleted, you didn't delete enough.
3. **Simplify and optimize.** But not before steps 1 and 2. The most common mistake smart people make is optimizing something that should not exist.
4. **Accelerate cycle time.** But not before step 3. Don't speed up a bad process.
5. **Automate.** But not before step 4. Don't automate waste.

## The Cardinal Rule

The steps are sequential. Never optimize before deleting. Never automate before simplifying. If someone jumps ahead, pull them back. The discipline IS the method.

## Tone

- Direct. Concrete. No jargon.
- Name specific things. "Your onboarding flow has 7 steps" not "the user experience could be streamlined."
- Ask "why" before "how."
- Challenge politely but relentlessly.
- Prefer one hard question over three soft suggestions.
- Output structured artifacts, not essays.

## How to Use

The user can ask you to:
- **Run the full Algorithm** — walk through all 5 steps in order on a specific problem
- **Run a single step** — e.g. "Question my requirements" or "What can I delete?"
- **Score something** — quick diagnostic against all 5 steps to find the weakest link

If the user asks to automate something without having questioned, deleted, and simplified first, say so. Don't block them — they're the operator — but name the risk:

> "You're jumping to Step 5 (Automate) without doing Steps 1-4. The most common mistake is automating a process that shouldn't exist. Want to start from Step 1, or proceed knowing the risk?"

Apply this for any out-of-order request.

PREAMBLE

    echo ""
    echo "---"
    echo ""

    # Append each step skill's body, rewriting references
    for skill in "${SKILL_DIRS[@]}"; do
      local src="$REPO_DIR/$skill/SKILL.md"
      [[ -f "$src" ]] || continue

      extract_body "$src" \
        | sed \
          -e 's|^# /question — |# Step 1: |' \
          -e 's|^# /delete — |# Step 2: |' \
          -e 's|^# /simplify — |# Step 3: |' \
          -e 's|^# /accelerate — |# Step 4: |' \
          -e 's|^# /automate — |# Step 5: |' \
          -e 's|^# /algorithm — .*|# Full Algorithm Run|' \
          -e 's|^# /score — .*|# Quick Diagnostic|' \
        | rewrite_skill_refs \
        | sed \
          -e 's|invoke the matching skill using the Skill tool|follow the matching step below|g' \
          -e 's|using the Skill tool||g' \
          -e 's|Point to the right skill for the deep dive|Point to the right step for the deep dive|g'

      echo ""
      echo "---"
      echo ""
    done
  } > "$dist_dir/the-algorithm.md"

  echo "  ✓ dist/the-algorithm.md"
}

# ── main ─────────────────────────────────────────────────────────────────────

echo "Exporting skills..."
echo ""

case "${1:-}" in
  --bundle)
    rm -rf "$EXPORT_DIR/thealgorithm-bundle"
    bundle_all
    echo ""
    echo "Bundle created. Upload export/thealgorithm-bundle/ as a single Claude Code skill."
    ;;
  --claude)
    # Export all skills in Claude Code web UI format
    rm -rf "$EXPORT_DIR"
    mkdir -p "$EXPORT_DIR"
    export_root_skill
    for skill in "${SKILL_DIRS[@]}"; do
      export_skill "$skill"
    done
    echo ""
    echo "All skills exported. Upload each folder under export/ as a separate skill,"
    echo "or run './export.sh --bundle' to create a single combined skill."
    ;;
  "")
    # Default: generate the universal dist file
    build_universal
    echo ""
    echo "Universal export created at dist/the-algorithm.md"
    echo "Upload or paste this file into any AI tool (Claude, ChatGPT, Gemini, etc.)"
    echo "See GUIDE.md for step-by-step setup instructions."
    ;;
  *)
    # Export a single skill (Claude Code format)
    rm -rf "$EXPORT_DIR/$1"
    export_skill "$1"
    ;;
esac

echo ""
echo "Done."
