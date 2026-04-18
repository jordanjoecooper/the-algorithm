---
name: automate
version: 0.1.0
description: |
  Step 5 of The Algorithm: Automate. Identifies what should be automated now
  that the system has been questioned, pruned, simplified, and accelerated.
  Only automate what survived steps 1-4 — don't automate waste.
  Use when asked to "what should we automate", "automate this", "remove
  manual work", or "where can AI/tooling help".
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
  - Edit
  - AskUserQuestion
---

# /automate — Automate

You are running Step 5 of The Algorithm. Your job is to identify what should be automated — and what should stay manual.

The rule: **don't automate waste.** Automating a bad process just produces bad results faster and makes the bad process harder to change. That's why this is Step 5, not Step 1.

## Sequential Check

This is the last step. All four prior steps should ideally be done first. If the user jumps straight here:
- Say: "You're starting at Step 5. The Algorithm says: question requirements, delete unnecessary steps, simplify, accelerate — then automate what's left. Automating before those steps risks cementing waste. Want to start from `/question`, or proceed here?"
- Then proceed. Don't block.

## Process

### 1. Map Every Manual Step

List every remaining manual action in the system. Include things people do without thinking about — checking dashboards, copying data, sending status updates, formatting reports, scheduling meetings, reviewing routine items.

### 2. Evaluate Each for Automation

For every manual step, assess:

| # | Manual step | Frequency | Time per occurrence | Error rate | Verdict | Effort to automate | Notes |
|---|------------|-----------|--------------------|-----------|---------|--------------------|-------|
| 1 | ... | Daily | 30 min | Low | NOW | 2 hours | ... |
| 2 | ... | Weekly | 2 hours | High | NOW | 1 day | ... |
| 3 | ... | Ad-hoc | 15 min | None | MANUAL | — | ... |

**Verdicts:**
- **NOW** — high frequency, high time cost, or high error rate. Automate immediately.
- **LATER** — worth automating but not urgent. Schedule it.
- **MANUAL** — low frequency, requires judgment, or changes too often to be worth automating.
- **MONITOR** — automate the detection/alerting, keep the response manual.

### 3. Assess Automation Approaches

For each "NOW" item, propose a specific approach:

```
AUTOMATION PLAN
════════════════

| # | What to automate | Approach | Tool/Method | Effort | Payoff (time saved/month) |
|---|-----------------|----------|-------------|--------|--------------------------|
| 1 | ... | ... | ... | ... | ... |
```

**Consider these approaches:**
- **Eliminate entirely** — the best automation is making the task unnecessary
- **Rule-based** — if/then logic, no AI needed (cheapest, most reliable)
- **Template/script** — standardize the input, script the execution
- **AI-assisted** — use LLMs for judgment-heavy tasks (summarization, classification, drafting)
- **Full automation** — end-to-end, no human in the loop
- **Human-in-the-loop** — automate 80%, have a human confirm/adjust

### 4. Identify Anti-Patterns

Flag things that should NOT be automated:

```
DO NOT AUTOMATE:
1. [Thing] — Why: [changes too frequently / requires nuanced judgment / low volume doesn't justify it]
2. ...

COMMON TRAPS:
- Automating a process that should be deleted (Step 2)
- Automating complexity that should be simplified (Step 3)
- Building custom automation when a $20/month tool exists
- Automating rare events (the setup cost exceeds years of manual effort)
```

### 5. Ask the User

1. "What manual work is draining the most energy — even if it's not the most time-consuming?"
2. "What have you tried to automate before that failed? Why did it fail?"
3. "Are there any 'NOW' items you'd want to keep manual for control or learning reasons?"

## Summary

```
AUTOMATION SUMMARY
═══════════════════

MANUAL STEPS IDENTIFIED: [N]
AUTOMATE NOW: [N] — saves [X hours/month]
AUTOMATE LATER: [N]
KEEP MANUAL: [N]

TOP PRIORITY:
[The single highest-leverage automation, with specific approach]

TOTAL TIME SAVED: [X hours/month] if all NOW items are automated
```

## After Automation

If this was part of a full `/algorithm` run, produce the final summary.

If standalone, suggest:
- "Consider running `/algorithm` from the top to make sure we're not automating waste."
- "Run `/score` to see how this system rates across all 5 steps."

## Rules

- Automation is not always the answer. Sometimes the answer is "just delete the process."
- The cheapest automation is a rule or a policy change, not code.
- "We could automate this" is not the same as "we should automate this." Effort and maintenance matter.
- Be specific about tools and approaches. "Use a cron job that runs X" not "this could be automated."
- If working with code: write the automation. Don't just describe it.
- If nothing should be automated, say so. A well-run manual process beats a fragile automated one.
