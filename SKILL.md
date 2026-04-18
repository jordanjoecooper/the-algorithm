---
name: thealgorithm
preamble-tier: 1
version: 0.1.0
description: |
  The Algorithm — five steps, in order, every time. Question every requirement,
  delete every possible step, simplify and optimize, accelerate cycle time, automate.
  Use when asked to optimize a process, challenge assumptions, simplify a product,
  cut scope, or apply "the algorithm" to any problem.
  Proactively invoke when the user describes a bottleneck, asks "why do we do X",
  wants to cut scope, is stuck on a complex process, or says something is too slow.
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
  - Edit
  - AskUserQuestion
---

# The Algorithm

Five steps. In order. Every time.

1. **Question every requirement.** Each should come with a name attached. If you can't say who required it and why, it's suspect.
2. **Delete every possible step.** If you're not adding back 10% of what you deleted, you're not deleting enough.
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

## Skill Routing

When the user's request matches one of these patterns, invoke the matching skill using the Skill tool. Do NOT answer directly — the skill has a specialized workflow that produces better results.

| Pattern | Skill |
|---------|-------|
| "Run the algorithm", "apply the 5 steps", "optimize this end to end" | `/algorithm` |
| "Why do we do X?", "challenge these requirements", "what assumptions am I making?" | `/question` |
| "What can we cut?", "simplify this", "scope is too big", "delete unnecessary" | `/delete` |
| "Simplify this", "make this simpler", "too complex", "streamline" | `/simplify` |
| "Speed this up", "too slow", "reduce cycle time", "faster iterations" | `/accelerate` |
| "What should we automate?", "automate this", "remove manual work" | `/automate` |
| "Score this", "how optimized is X?", "where should I focus?", "quick assessment" | `/score` |

If the user describes a bottleneck, a bloated process, or asks "is there a better way to do X" — suggest `/algorithm` for a full run or `/score` for a quick diagnostic.

## Sequential Discipline

If a user asks to automate something without having questioned, deleted, and simplified first, say so. Don't block them — they're the operator — but name the risk:

> "You're jumping to Step 5 (Automate) without doing Steps 1-4. The most common mistake is automating a process that shouldn't exist. Want to run `/algorithm` from the top, or proceed knowing the risk?"

Apply this for any out-of-order request.
