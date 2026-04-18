---
name: delete
version: 0.1.0
description: |
  Step 2 of The Algorithm: Delete every possible step. Maps every component,
  step, and feature, then argues for removing each one. Applies the 10% rule —
  if you're not adding back 10% of what you deleted, you didn't delete enough.
  Use when asked to "cut scope", "what can we remove", "simplify this",
  "too many features", or "what's unnecessary".
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
  - Edit
  - AskUserQuestion
---

# /delete — Delete Every Possible Step

You are running Step 2 of The Algorithm. Your job is to find everything that can be removed.

The rule: **if you're not adding back 10% of what you deleted, you're not deleting enough.**

## Sequential Check

Before starting, ask yourself: has the user already questioned requirements (Step 1)?

- If yes (they mention having done it, or you can see the output), proceed.
- If unclear, briefly note: "Step 1 is questioning requirements — have you done that? If not, consider running `/question` first so we're not deleting against unvalidated requirements." Then proceed regardless. Don't block.

## Process

### 1. Map Everything

List every component, step, feature, process element, or piece of the thing being analyzed. Be exhaustive. Include things people take for granted.

If working with code, actually read the codebase. List real files, real functions, real features.
If working with a process, map every step from trigger to completion.
If working with a product, list every feature and surface.

### 2. Argue for Deletion

For EVERY item on the list, make the case for removing it. Even the ones that seem essential. The exercise is the point — it forces you to articulate why things exist.

For each item:
- **What happens if we remove it?** Be specific about the actual consequence, not the feared consequence.
- **Who would notice?** If the answer is "nobody for weeks" — strong delete candidate.
- **What's it costing us?** Maintenance, complexity, confusion, speed.
- **Is it load-bearing or decorative?** Does the system break without it, or just look different?

### 3. Make Verdicts

```
DELETION AUDIT
═══════════════

SUBJECT: [What we're examining]

| # | Component/Step | Verdict | Impact if removed | Cost of keeping | Rationale |
|---|---------------|---------|-------------------|-----------------|-----------|
| 1 | ...           | CUT     | ...               | ...             | ...       |
| 2 | ...           | MERGE   | Combine with #5   | ...             | ...       |
| 3 | ...           | KEEP    | System breaks      | Low             | ...       |
| 4 | ...           | CUT     | ...               | ...             | ...       |

TOTAL COMPONENTS: [N]
CUT: [N] — remove these
MERGE: [N] — combine these
KEEP: [N] — these earn their place

10% RULE CHECK:
- Deleted [N]% of components
- [Assessment: Is this enough? If under 20%, we probably didn't push hard enough.]
```

### 4. Identify the Sacred Cows

Call out specifically: which items did nobody think could be removed? Which ones "have always been there"? These are the most important ones to challenge.

```
SACRED COWS:
1. [Thing everyone assumes is essential] — Actually needed because: [reason] / Actually removable because: [reason]
2. ...
```

### 5. Ask the User

1. "What did I cut that you'd fight for? Make the case — I'll push back."
2. "What am I not seeing? What dependencies or consequences did I miss?"
3. "Is there anything on the KEEP list that, honestly, you've wanted to cut for a while?"

## After Deletion

Suggest next steps:
- `/simplify` to move to Step 3 (simplify what remains)
- `/algorithm` to run all 5 steps

## Rules

- Be aggressive with cuts. The user can always add things back. It's harder to see what to remove than what to add.
- "We might need it someday" is not a reason to keep something. That's hoarding.
- "It was hard to build" is not a reason to keep something. That's sunk cost.
- "Customers asked for it" — which customers? How many? When? One loud customer is not a requirement.
- If working with code: actually propose the deletions. Name the files, the functions, the features. Don't be abstract.
- If everything genuinely needs to stay, say so. But be suspicious of that conclusion.
