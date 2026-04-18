---
name: score
version: 0.1.0
description: |
  Quick diagnostic: score any process, product, or system against all five
  steps of The Algorithm. Identifies the weakest step and recommends where
  to focus. Fast assessment — takes minutes, not hours.
  Use when asked to "score this", "how optimized is X", "where should I focus",
  "quick assessment", "diagnose this", or "rate this process".
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - AskUserQuestion
---

# /score — Quick Diagnostic

You are running a fast diagnostic against The Algorithm's five steps. Your job is to score the thing, find the weakest link, and point the user at the right next step.

This should be fast — a few minutes, not an hour-long analysis.

## Process

### 1. Understand the Subject

If the user gave you something specific, work with it. If they were vague, ask one question: "What specifically should I score? A process, a product, a feature, a workflow?"

### 2. Score Each Step

Evaluate the subject against each of the five steps on a 1-10 scale:

- **1-3:** Not addressed at all. Major issues.
- **4-6:** Partially addressed. Room for significant improvement.
- **7-8:** Well addressed. Minor improvements possible.
- **9-10:** Excellent. This step has been thoroughly applied.

### 3. Present the Scorecard

```
ALGORITHM SCORECARD
════════════════════

SUBJECT: [What we're scoring]

  Step 1: Question Requirements    [ X/10 ]  ░░░░░░░░░░  [one-line finding]
  Step 2: Delete Steps             [ X/10 ]  ░░░░░░░░░░  [one-line finding]
  Step 3: Simplify & Optimize      [ X/10 ]  ░░░░░░░░░░  [one-line finding]
  Step 4: Accelerate Cycle Time    [ X/10 ]  ░░░░░░░░░░  [one-line finding]
  Step 5: Automate                 [ X/10 ]  ░░░░░░░░░░  [one-line finding]
                                   ════════
  OVERALL                          [ X/10 ]

WEAKEST LINK: Step [N] — [What's wrong and why it matters]
STRONGEST: Step [N] — [What's working well]
BIGGEST OPPORTUNITY: [The single change that would improve the score the most]
```

Use the bar visualization: fill blocks proportional to score (e.g., 7/10 = `███████░░░`).

### 4. Recommend Next Action

Based on the weakest link:

| Weakest Step | Recommendation |
|-------------|----------------|
| Step 1 | "Run `/question` — your requirements haven't been challenged." |
| Step 2 | "Run `/delete` — there's likely a lot you can cut." |
| Step 3 | "Run `/simplify` — unnecessary complexity is slowing you down." |
| Step 4 | "Run `/accelerate` — the system is clean but slow." |
| Step 5 | "Run `/automate` — you're doing manually what should be automated." |
| All low | "Run `/algorithm` — full five-step run from the top." |
| All high | "You're in good shape. Re-score in a month or when things change." |

## Rules

- Be honest. A 9/10 should be rare. Most things score 4-6 on most steps.
- One-line findings should be specific. "3 of 7 features have no clear owner" not "some requirements are unclear."
- The overall score is NOT an average. It's a judgment call weighted toward the weakest link. A chain is only as strong as its weakest link.
- This is a diagnostic, not a treatment. Point to the right skill for the deep dive.
- If you don't have enough information to score a step, say so and score it as "?/10 — insufficient information."
- Fast means fast. Don't over-research. The user wants a directional read, not a thesis.
