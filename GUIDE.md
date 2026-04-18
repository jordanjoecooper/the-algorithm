# How to Use The Algorithm with Any AI Tool

The Algorithm is a five-step framework for optimizing any process, product, or decision. This guide shows you how to set it up with your AI tool of choice so it can walk you through the framework interactively.

**You'll need one file:** [`dist/the-algorithm.md`](dist/the-algorithm.md)

You can download the file or just copy the raw text.

---

## Claude (claude.ai or Claude Desktop)

### Option A: Add to a Project (recommended)

This makes The Algorithm available in every conversation within a project.

1. Go to [claude.ai](https://claude.ai) and log in
2. In the sidebar, click **Projects**, then **Create Project**
3. Name it something like "The Algorithm"
4. In the project settings, find **Project Knowledge** and click **Add content**
5. Upload the `the-algorithm.md` file, or paste its contents
6. Start a new conversation inside the project

### Option B: Upload in a conversation

This works for a single conversation.

1. Start a new conversation on [claude.ai](https://claude.ai)
2. Click the attachment/paperclip icon and upload `the-algorithm.md`
3. Start talking — Claude will use the framework

---

## ChatGPT

**Quickest option:** [Use the ready-made Algorithm GPT](https://chatgpt.com/g/g-69e003e0e2c881918512852dc65e04bd-the-algorithm) — no setup required.

Or create your own:

### Option A: Create your own Custom GPT

This creates a reusable GPT you control. Requires a paid ChatGPT plan (Plus, Team, or Enterprise).

1. Go to [chatgpt.com/create](https://chatgpt.com/create) and log in
2. Click the **Configure** tab
3. Set the name to "The Algorithm"
4. In the **Instructions** field, paste the following:

   ```
   You apply The Algorithm — a five-step optimization framework. Your knowledge
   file contains the full detailed process for each step. Always reference it.

   The five steps, in order, every time:
   1. Question every requirement — each should come with a name attached
   2. Delete every possible step — if you're not adding back 10%, you didn't delete enough
   3. Simplify and optimize — but not before steps 1-2
   4. Accelerate cycle time — but not before step 3
   5. Automate — but not before step 4

   The steps are sequential. Never skip ahead. If the user jumps to a later step,
   flag the risk, then proceed if they insist.

   Tone: Direct, concrete, no jargon. Name specific things. Ask "why" before "how."
   Challenge politely but relentlessly. Output structured artifacts (tables,
   scorecards), not essays.

   The user can ask you to:
   - Run the full Algorithm (all 5 steps in order)
   - Run a single step (e.g. "question my requirements")
   - Score something (quick diagnostic against all 5 steps)

   At each step, present structured output, then ask the user at least one question
   before moving on. They have context you don't.
   ```

5. Under **Knowledge**, upload the `the-algorithm.md` file (the full instructions are too long for the Instructions field, so the GPT reads the detail from this file)
6. Under **Capabilities**, enable **Web Search** and **Canvas**. Disable the rest.
7. Click **Save** and choose who can access it
8. Start a conversation with your new GPT

### Option B: Upload in a conversation

1. Start a new conversation on [chatgpt.com](https://chatgpt.com)
2. Upload `the-algorithm.md` as a file attachment
3. Tell ChatGPT: "Use the framework in the attached file to help me optimize my process"

---

## Google Gemini

### Option A: Create a Gem (recommended)

Requires Gemini Advanced (Google One AI Premium plan).

1. Go to [gemini.google.com](https://gemini.google.com) and log in
2. In the left sidebar, click **Gem manager**, then **New Gem**
3. Name it "The Algorithm"
4. Paste the contents of `the-algorithm.md` into the **Custom Instructions** field
5. Click **Save** — the Gem appears in your sidebar for reuse

### Option B: Paste into a conversation

1. Start a new conversation on [gemini.google.com](https://gemini.google.com)
2. Paste the contents of `the-algorithm.md` and say "Use this framework"

---

## Other AI Tools (Copilot, Grok, Perplexity, etc.)

Most AI chat tools let you either:
- **Paste custom instructions** in a settings/system prompt area
- **Upload a file** at the start of a conversation

The `the-algorithm.md` file works with any tool that accepts text instructions. Just paste or upload it, then start asking questions.

---

## What to Say Once It's Set Up

Here are some prompts to try:

### Quick diagnostic
> "Score our hiring process against The Algorithm. It takes 6 weeks from first interview to offer letter."

### Full five-step run
> "Run The Algorithm on our deploy pipeline. It takes 45 minutes and breaks 20% of the time."

### Challenge requirements
> "We're building a mobile app because the board said mobile is strategic. Question that requirement."

### Find what to cut
> "Here's our feature list for v2: [list features]. What can we delete?"

### Simplify
> "Our pricing has 4 tiers, 3 add-ons, annual and monthly billing, and custom enterprise deals. Simplify it."

### Speed things up
> "Our content approval process takes 2 weeks. How do we accelerate it?"

### Decide what to automate
> "Every Monday our ops team manually pulls data from 3 sources and emails a report. Should we automate this?"

---

## What to Expect

When you use The Algorithm, the AI will:

- **Follow the five steps in order** — it won't jump ahead to solutions before understanding the problem
- **Ask you questions** — it needs your context and judgment at each step
- **Push back politely** — if you try to skip steps, it'll flag the risk
- **Give structured output** — tables, scorecards, and clear recommendations instead of long paragraphs
- **Be direct** — specific findings, not vague suggestions

---

## For Claude Code Users

If you use [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (the CLI tool), you can install The Algorithm as native slash commands instead. See the main [README](README.md) for install instructions. This gives you `/algorithm`, `/question`, `/delete`, `/simplify`, `/accelerate`, `/automate`, and `/score` as interactive commands.
