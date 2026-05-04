---
name: onboard
description: Populate identity/about-you.md and identity/voice-guide.md interactively. Use when the user says "onboard me", "set up my identity", or when about-you.md / voice-guide.md is missing or empty.
---

# onboard

Asks the user a short series of questions and writes their answers to `identity/about-you.md` and `identity/voice-guide.md`. These files are read at the start of every future session, so this is the highest-leverage 10 minutes a new user can spend.

## When to use

- First session after `setup` completes.
- `identity/about-you.md` or `identity/voice-guide.md` is missing or empty.
- User says "onboard me" or "redo my identity".

## Steps

### 1. Check current state

Read `identity/about-you.md` and `identity/voice-guide.md` if they exist. If either has content, ask whether to replace, append, or skip.

### 2. Ask about-you questions

Keep it conversational — one or two questions at a time, not a wall.

**Identity:**
- What's your name and what do you do (role, company or "independent")?
- What are you working on right now? (top 1–3 things)
- What's the longer-term thing you're building toward?

**Working style:**
- How do you like to start your day? (deep work first, meetings first, triage first)
- What tools do you live in? (editor, notes app, calendar, comms)
- Anything an AI agent should know about your context — timezone, schedule, deep-work blocks?

**Domain:**
- What kinds of documents do you write most? (PRDs, code, posts, briefs, emails)
- Who are your most frequent collaborators? (so we know who to track in `wiki/people/`)

### 3. Ask voice-guide questions

- Tone: formal, casual, blunt, warm — pick a few words.
- Length default: terse, normal, expansive?
- Any phrases or words you hate? (e.g., "delve", "leverage as a verb", em dashes)
- Any structural preferences? (bulleted vs prose, headings vs flat, citations vs not)
- How do you want disagreement handled? (push back hard, suggest gently, accept and proceed)

### 4. Write the files

Write `identity/about-you.md` with sections: **Bio**, **Current focus**, **Working style**, **Domain**, **Collaborators**.

Write `identity/voice-guide.md` with sections: **Tone**, **Length**, **Avoid**, **Structure**, **Disagreement**.

Use direct, first-person voice in both, as if the user wrote them.

### 5. Confirm

Show the user the final files. Ask if anything's wrong. Edit on request.

### 6. Suggest next steps

- "Drop a meeting transcript in `raw/meetings/` and ask me to compile it."
- "Ask me to write a one-pager on something you're thinking about."
- "Tomorrow, just say 'resume' to pick up where we left off."

## Notes

- Don't extrapolate. If the user gives a one-word answer, use a one-word answer. They can fill in more later.
- Both files are gitignored — they're personal.
- The `voice-guide.md` is consulted by the `write` and `review` skills — keep it actionable, not abstract.
