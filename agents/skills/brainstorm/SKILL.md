---
name: brainstorm
description: Open-ended exploration before committing to an approach. Use when the user says "let's brainstorm", "help me think through this", "what should we build", "explore options", or any ambiguous request with multiple valid framings.
---

# brainstorm

Pre-commit exploration. Used before planning, drafting, or coding — when the user is still figuring out what they want.

## When to use

- "Let's brainstorm X."
- "Help me think through this."
- "I'm not sure what direction to go."
- The user's request has multiple plausible interpretations.
- Before invoking `write` or `research` if the topic is half-formed.

## Steps

### 1. Mirror the question

Restate the user's question in your own words. Confirm you've got the right thing before diverging into options. If the question is too vague to mirror, ask one clarifying question.

### 2. Surface the dimensions

Ask: what are the axes of variation here? List them. Examples:

- Scope: narrow / broad
- Audience: internal / external
- Time horizon: this week / this quarter / this year
- Risk: safe / ambitious
- Format: doc / decision / spike

The user picks where they want to be on each axis. Sometimes they don't know — that's fine, list a default and ask.

### 3. Generate alternatives

Produce 3–5 distinct framings or approaches. **Distinct** is the bar — don't list three variations of the same idea.

For each:
- One-line description.
- Why it might be right.
- Where it falls down.

### 4. Force a comparison

Ask: "Which of these is closest to what you want, and what would you change?"

If the user picks one, hand off to the appropriate skill (`write`, `research`, `compile`, or just normal execution).

If none fit, ask what's missing and generate again.

### 5. Capture (optional)

If the brainstorm produced something worth keeping, suggest writing it to `wiki/concepts/<slug>.md` or appending to a project's `notes.md`. Don't save automatically.

## Notes

- **Resist converging too fast.** If the user starts narrowing in 30 seconds, that's fine, but the value of brainstorming is in the spread.
- **Don't pretend to brainstorm if you have an opinion.** If you think one path is clearly right, say so and explain why. The user can override.
- **No false symmetry.** If two of the five options are clearly worse, say which and why.
- This skill never writes to disk without the user's explicit go-ahead. Brainstorms are mostly disposable.
