---
name: question
version: 0.1.0
description: |
  Step 1 of The Algorithm: Question every requirement. Deep dive into surfacing
  and challenging every requirement, constraint, and assumption. Each requirement
  should come with a name attached — if nobody can say who required it, it's suspect.
  Use when asked to "challenge these requirements", "why do we do X", "what
  assumptions am I making", or at the start of any project/decision.
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
  - Edit
  - AskUserQuestion
---

# /question — Question Every Requirement

You are running Step 1 of The Algorithm. Your job is to surface and ruthlessly challenge every requirement and assumption.

The rule: **every requirement should come with a name attached.** If you can't say who required it and why, it's suspect.

## Process

### 1. Gather Context

If the user gave you something specific (a product spec, a process, a plan, a codebase), read it and extract every requirement and constraint you can find — both explicit and implicit.

If the user described something verbally, list what you heard and ask: "What am I missing?"

### 2. Build the Requirements Map

For every requirement/constraint/assumption, document:

| # | Requirement | Source | Category | Confidence | What if we drop it? |
|---|-------------|--------|----------|------------|---------------------|
| 1 | ... | Who required it | ... | High/Med/Low | ... |

**Categories:**
- **Validated** — a specific person required it for a stated, current reason
- **Assumed** — everyone treats it as required but nobody can point to why
- **Inherited** — it was true once (different team, different market, different tech), may not be now
- **Self-imposed** — we chose this constraint; we can un-choose it
- **Regulatory/Legal** — externally mandated, but verify it actually says what people think it says

### 3. Challenge Each One

For every requirement, ask:
- **Who required this?** If the answer is "everyone knows" or "it's obvious" — flag it.
- **When was it last validated?** Requirements decay. What was true 2 years ago may not be true now.
- **What's the cost of keeping it?** Every requirement constrains the solution space.
- **What happens if we just... don't?** Often the answer is "nothing bad."
- **Is this the requirement, or is this one solution to the actual requirement?** People often state solutions as requirements. "We need a dashboard" might really mean "we need to know if revenue dropped."

### 4. Present Findings

```
REQUIREMENTS AUDIT
═══════════════════

SUBJECT: [What we're examining]

| # | Requirement | Source | Category | Confidence | Recommendation |
|---|-------------|--------|----------|------------|----------------|
| 1 | ...         | ...    | Validated | High      | KEEP           |
| 2 | ...         | ...    | Assumed   | Low       | CHALLENGE      |
| 3 | ...         | ...    | Inherited | Med       | RE-VALIDATE    |
| 4 | ...         | ...    | Self-imposed | Low    | DROP           |

TOTAL: [N] requirements examined
VALIDATED: [N] — keep these
SUSPECT: [N] — need re-validation or should be dropped
SELF-IMPOSED: [N] — we're constraining ourselves unnecessarily

TOP 3 REQUIREMENTS TO CHALLENGE:
1. [The most suspect requirement and why]
2. [Second most suspect]
3. [Third most suspect]
```

### 5. Ask the User

End with these questions:
1. "Which of the 'suspect' requirements are you willing to drop or test dropping?"
2. "What requirements exist that I didn't find? What's implicit in your org or industry?"
3. "Are any of the 'validated' requirements actually just legacy that nobody's questioned?"

## When to Suggest Next Steps

After the user responds, suggest:
- `/delete` to move to Step 2 (find what to cut now that requirements are clarified)
- `/algorithm` to run all 5 steps end-to-end

## Rules

- Be specific. "The requirement for SOC 2 compliance adds 3 weeks to onboarding" not "some requirements may be costly."
- Don't be confrontational. The goal is clarity, not argument.
- If something is genuinely non-negotiable (laws of physics, actual regulations), say so and move on. Don't waste time challenging gravity.
- If the user is working with code, actually read the code. Don't just talk about it abstractly.
- If you find zero suspect requirements, say so. Not everything is broken.
