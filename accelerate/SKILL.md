---
name: accelerate
version: 0.1.0
description: |
  Step 4 of The Algorithm: Accelerate cycle time. Finds every wait, delay, handoff,
  and batch in a system and proposes ways to speed them up. Focuses on the critical
  path and feedback loops.
  Use when asked to "speed this up", "too slow", "reduce cycle time",
  "faster iterations", "shorten feedback loops", or "this takes too long".
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
  - Edit
  - AskUserQuestion
---

# /accelerate — Accelerate Cycle Time

You are running Step 4 of The Algorithm. Your job is to find every source of delay and propose ways to reduce it.

The rule: **don't speed up a bad process.** That's why this comes after questioning, deleting, and simplifying. Accelerating a broken system just produces broken results faster.

## Sequential Check

Steps 1-3 should come before this. If the user hasn't done them:
- Briefly note: "Steps 1-3 clean up what you're accelerating. Speeding up a process that has unnecessary steps bakes in waste. Consider `/question`, `/delete`, or `/simplify` first."
- Then proceed. Don't block.

## Process

### 1. Map the Timeline

Trace the end-to-end flow of whatever the user is analyzing. For every stage, identify:
- **Duration** — how long does this stage take?
- **Wait time** — how long do things sit idle between stages?
- **Handoffs** — who passes what to whom?
- **Batching** — what waits to be grouped before moving forward?
- **Approvals** — what needs sign-off before proceeding?

### 2. Find the Critical Path

Identify the sequence of dependent steps that determines the total end-to-end time. Everything else is parallel or optional.

```
CYCLE TIME MAP
═══════════════

SUBJECT: [What we're accelerating]
CURRENT END-TO-END: [Total time from start to finish]

CRITICAL PATH:
[Step A] → [wait] → [Step B] → [wait] → [Step C] → [done]
  2 days      3 days    1 day      5 days    2 days
                                   ↑
                                   This is the bottleneck

| # | Stage | Duration | Wait after | Type | Bottleneck? |
|---|-------|----------|-----------|------|-------------|
| 1 | ...   | ...      | ...       | Work/Wait/Approval/Handoff | Yes/No |
```

### 3. Propose Accelerations

For each bottleneck and delay:

| # | Bottleneck | Current | Proposed | How | Risk |
|---|-----------|---------|----------|-----|------|
| 1 | ... | 5 days | 1 day | ... | ... |

**Acceleration tactics to consider:**
- **Parallelize:** Can sequential steps run at the same time?
- **Eliminate handoffs:** Can one person/team do both steps?
- **Kill batching:** Can you process items one at a time instead of in groups?
- **Remove approvals:** Can you replace approval with a rule or audit?
- **Shorten feedback loops:** Can you learn if something works in hours instead of weeks?
- **Reduce scope per cycle:** Smaller batches move faster. Ship daily instead of weekly.
- **Front-load information:** Can decisions be made earlier with less data instead of later with more?

### 4. Calculate the Impact

```
ACCELERATION SUMMARY
═════════════════════

CURRENT CYCLE TIME: [X]
PROPOSED CYCLE TIME: [Y]
SPEEDUP: [X/Y]x faster

TOP 3 WINS:
1. [Biggest time savings] — saves [duration] — by [method]
2. ...
3. ...

FEEDBACK LOOP IMPROVEMENTS:
- Current: learn if [thing] works in [time]
- Proposed: learn in [shorter time] by [method]
```

### 5. Ask the User

1. "What delays am I not seeing? Where does work actually sit idle?"
2. "Which of these speedups is politically feasible? What would face resistance?"
3. "What's the real reason for the longest delay? Is it technical, organizational, or just habit?"

## After Acceleration

Suggest next steps:
- `/automate` to move to Step 5 (automate the accelerated system)
- `/algorithm` to run all 5 steps

## Rules

- Measure in concrete units. "Reduce from 5 days to 1 day" not "significantly faster."
- Organizational bottlenecks are real bottlenecks. Don't pretend everything is a technical problem.
- The biggest delays are usually wait times between steps, not the steps themselves. Look at the whitespace.
- "We've always done it this way" is not a speed constraint. It's a habit.
- If the system is already fast, say so. Don't manufacture improvements.
