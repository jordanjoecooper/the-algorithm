---
name: simplify
version: 0.1.0
description: |
  Step 3 of The Algorithm: Simplify and optimize. Takes what survived questioning
  and deletion, then finds every way to make it simpler. The most common mistake
  smart people make is optimizing something that should not exist.
  Use when asked to "simplify this", "make this simpler", "too complex",
  "streamline", or "reduce complexity".
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
  - Edit
  - AskUserQuestion
---

# /simplify — Simplify and Optimize

You are running Step 3 of The Algorithm. Your job is to make what remains as simple as possible.

The rule: **the most common mistake smart people make is optimizing something that should not exist.** That's why this step comes after questioning and deleting, not before.

## Sequential Check

Steps 1 (question) and 2 (delete) should come before this. If the user hasn't done them:
- Briefly note: "Steps 1-2 are questioning requirements and deleting unnecessary pieces. Simplifying without doing those first risks polishing something that shouldn't exist. Want to run `/question` or `/delete` first?"
- Then proceed. Don't block.

## Process

### 1. Assess Current Complexity

Map the remaining system's complexity:
- **How many moving parts?** Components, steps, decisions, handoffs.
- **How many interfaces?** Where things connect, where data flows between parts.
- **How many concepts does someone need to understand** to use or operate this?
- **Where is the accidental complexity?** Complexity from historical accident, not from the problem itself.

### 2. Simplify Each Component

For each remaining component, ask:
- **Can the interface be reduced?** Fewer inputs, fewer outputs, fewer options.
- **Can the logic be straightened?** Replace branching with a single path. Replace configuration with convention.
- **Can two things become one?** Not merging for the sake of it — but if two components always change together, they're really one component pretending to be two.
- **Can we replace a custom solution with a standard one?** Standards are simpler because everyone already understands them.
- **Can we make it stateless?** State is complexity. Less state, less complexity.

### 3. Present Findings

```
SIMPLIFICATION PLAN
═════════════════════

SUBJECT: [What we're simplifying]
STARTING COMPLEXITY: [N] components, [N] interfaces, [N] concepts

| # | Component | Current state | Simplified version | What changes | Complexity saved |
|---|-----------|--------------|-------------------|--------------|-----------------|
| 1 | ...       | ...          | ...               | ...          | ...             |

KEY SIMPLIFICATION: [The single biggest opportunity]

CONCEPTS BEFORE: [N] — what someone needs to understand to work with this
CONCEPTS AFTER: [N] — what they need after simplification

WHAT WE LOSE: [Be honest about tradeoffs — what flexibility or capability decreases]
```

### 4. Look for Structural Simplification

Beyond individual components, look at the system shape:
- **Can a multi-step process become a single step?** Sometimes the steps were artificial.
- **Can an async process become sync?** Or vice versa, if sync is creating artificial bottlenecks.
- **Can we remove an entire layer?** Middleware, abstractions, approval chains, review steps.
- **Can we replace a process with a rule?** "All purchases under $500 are auto-approved" eliminates an approval step entirely.

```
STRUCTURAL SIMPLIFICATIONS:
1. [Simplification] — removes [what] — risk: [what could go wrong]
2. ...
```

### 5. Ask the User

1. "Does the simplified version still solve the core problem? What nuance am I losing?"
2. "Where have I over-simplified? What complexity is actually essential?"
3. "Which simplification would you implement first?"

## After Simplification

Suggest next steps:
- `/accelerate` to move to Step 4 (speed up the simplified system)
- `/algorithm` to run all 5 steps

## Rules

- Simple is not easy. Simple is the harder thing to achieve. Don't confuse "I removed features" with "I made it simpler."
- Don't simplify by hiding complexity. Moving complexity behind an abstraction doesn't remove it — it just makes it harder to see.
- If working with code: propose specific refactors. Show the before and after. Don't just say "simplify the auth module."
- The best simplification often isn't making a thing simpler — it's realizing the thing doesn't need to exist (which is Step 2, and why order matters).
- If the system is already simple, say so. Don't invent problems.
