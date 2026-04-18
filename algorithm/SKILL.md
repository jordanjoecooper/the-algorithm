---
name: algorithm
version: 0.1.0
description: |
  Full five-step algorithm run. Walks through all steps sequentially:
  (1) question every requirement, (2) delete every possible step,
  (3) simplify and optimize, (4) accelerate cycle time, (5) automate.
  Enforces sequential discipline — no skipping ahead.
  Use when asked to "run the algorithm", "apply the 5 steps", "optimize this
  end to end", or when starting a new analysis of any process, product, or decision.
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
  - Edit
  - AskUserQuestion
---

# /algorithm — Full Five-Step Run

You are running The Algorithm: five steps, in order, on whatever the user gives you.

## Before You Start

If the user's input is vague ("my business is slow", "things aren't working"), ask one clarifying question before proceeding. You need a specific thing to analyze — a process, product, feature, workflow, decision, or system.

If the input is specific enough to work with, start immediately. Don't ask unnecessary setup questions.

## Step 1: Question Every Requirement

**Goal:** Surface every requirement and assumption. Challenge each one.

Do this:
1. List every requirement, constraint, and assumption you can identify in what the user described
2. For each one, ask: Who required this? Why? What happens if we drop it?
3. Categorize each as:
   - **Validated** — someone specific required it for a stated reason
   - **Assumed** — everyone thinks it's required but nobody can say why
   - **Inherited** — it was true once, may not be true now
   - **Self-imposed** — we chose this constraint ourselves

Present as:

```
STEP 1: QUESTION EVERY REQUIREMENT
════════════════════════════════════

| # | Requirement | Source | Category | What if we drop it? |
|---|-------------|--------|----------|---------------------|
| 1 | ...         | ...    | ...      | ...                 |

CHALLENGED: [N] requirements examined
SUSPECT: [N] are assumed, inherited, or self-imposed
```

Then ask the user: "What requirements am I missing? Which of these are truly non-negotiable?"

**Wait for the user to respond before proceeding to Step 2.**

## Step 2: Delete Every Possible Step

**Goal:** Argue for removing every component, step, or feature. Find the minimum viable version.

Do this:
1. Map every component/step/feature in the system
2. For each one, make the case for removing it
3. Apply the 10% rule: if you're not adding back 10% of what you deleted, you didn't delete enough
4. Mark each as: **Cut** / **Merge** (combine with another) / **Keep** (with justification)

Present as:

```
STEP 2: DELETE EVERY POSSIBLE STEP
════════════════════════════════════

| # | Component/Step | Verdict | Rationale |
|---|----------------|---------|-----------|
| 1 | ...            | CUT     | ...       |
| 2 | ...            | MERGE   | ...       |
| 3 | ...            | KEEP    | ...       |

DELETED: [N] of [M] components
10% CHECK: [Are we adding anything back? If not, we probably didn't cut enough.]
```

Then ask: "What am I wrong about? What did I cut that you'd fight for?"

**Wait for the user to respond before proceeding to Step 3.**

## Step 3: Simplify and Optimize

**Goal:** Take what survived Steps 1-2 and make it as simple as possible.

Do this:
1. Look at what remains after deletion
2. For each remaining component: Can it be made simpler? Can the interface be reduced? Can the logic be straightened?
3. Identify complexity that exists because of historical accident, not necessity
4. Propose the simplest version that still works

Present as:

```
STEP 3: SIMPLIFY AND OPTIMIZE
═══════════════════════════════

WHAT REMAINS: [N] components after deletion

| # | Component | Current complexity | Simplified version | What changes |
|---|-----------|-------------------|-------------------|--------------|
| 1 | ...       | ...               | ...               | ...          |

KEY SIMPLIFICATION: [The single biggest simplification opportunity]
```

Then ask: "Does the simplified version still solve the core problem? What nuance am I losing?"

**Wait for the user to respond before proceeding to Step 4.**

## Step 4: Accelerate Cycle Time

**Goal:** Find ways to make the simplified system run faster — shorter feedback loops, less waiting, faster iterations.

Do this:
1. Identify every wait, delay, handoff, approval, or batch in the remaining system
2. For each one: Can it be parallelized? Made real-time? Eliminated?
3. Find the critical path and focus acceleration there
4. Propose specific cycle time reductions

Present as:

```
STEP 4: ACCELERATE CYCLE TIME
═══════════════════════════════

| # | Bottleneck | Current time | Proposed | How |
|---|-----------|-------------|----------|-----|
| 1 | ...       | ...         | ...      | ... |

CRITICAL PATH: [What determines the end-to-end time]
BIGGEST WIN: [The single change that saves the most time]
```

Then ask: "What constraints on speed am I not seeing? Any dependencies I'm missing?"

**Wait for the user to respond before proceeding to Step 5.**

## Step 5: Automate

**Goal:** Identify what should be automated now that the system is questioned, pruned, simplified, and accelerated.

Do this:
1. List every remaining manual step
2. For each: Is it worth automating? What's the effort vs. payoff?
3. Categorize as: **Automate now** / **Automate later** / **Keep manual**
4. Only automate things that survived all four prior steps

Present as:

```
STEP 5: AUTOMATE
═════════════════

| # | Manual step | Verdict | Effort | Payoff | How |
|---|------------|---------|--------|--------|-----|
| 1 | ...        | NOW     | ...    | ...    | ... |
| 2 | ...        | LATER   | ...    | ...    | ... |
| 3 | ...        | MANUAL  | ...    | ...    | ... |

AUTOMATE FIRST: [The highest-leverage automation]
DO NOT AUTOMATE: [What should stay manual and why]
```

## Final Output

After all 5 steps, produce a summary:

```
THE ALGORITHM — SUMMARY
════════════════════════

SUBJECT: [What we analyzed]

STEP 1 — REQUIREMENTS: [N] challenged, [N] suspect
STEP 2 — DELETION: [N] of [M] components cut
STEP 3 — SIMPLIFICATION: [Key simplification]
STEP 4 — ACCELERATION: [Key speedup]
STEP 5 — AUTOMATION: [N] items to automate now

NEXT ACTIONS:
1. [Most important concrete action]
2. [Second most important]
3. [Third most important]

BIGGEST INSIGHT: [The single most valuable thing we found]
```

Offer to save this summary to a file if the user wants to keep it.

## Rules

- Never skip a step. Never reorder steps.
- If the user says "skip to step 5" — push back, explain why, but ultimately defer to them.
- Each step must produce a structured artifact before advancing.
- Ask the user at least one question per step. They have context you don't.
- Be specific. Name things. Use numbers. "Cut 4 of 7 steps" not "streamline the process."
- If the problem turns out to be simple, say so and finish fast. Don't pad.
