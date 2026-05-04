---
name: review
description: Critique a document for structure, clarity, and voice. Use when the user says "review this", "what's wrong with this draft", "tear this apart", or hands you a document and asks for feedback.
---

# review

Direct, specific critique of a document. Not a polish pass — a structural review with actionable changes.

## When to use

- "Review this draft."
- "What's missing in this PRD?"
- "Be brutal — what's wrong with this?"
- User pastes a doc and asks for feedback.

If the user wants polish (typos, line edits) rather than critique, do that instead and tell them you're switching modes.

## Steps

### 1. Read identity and voice

Read `identity/voice-guide.md`. The voice guide tells you what "good" sounds like for this user.

### 2. Read the document twice

First pass: get the gist and the structure. Second pass: look for specific problems.

### 3. Apply the four-axis review

Score each axis 1–5 and call out the top issue:

| Axis | Question |
|------|----------|
| **Premise** | Is the problem worth solving? Is it framed right? |
| **Structure** | Does the document flow? Right sections, right order? Anything missing? |
| **Argument** | Are claims supported? Where's the weakest link? |
| **Voice** | Does it match the user's voice guide? Any AI tells, banned phrases, padding? |

### 4. Format the review

Lead with the headline finding — the one thing that, if fixed, would most improve the doc. Then go axis-by-axis, top issue per axis. Then a "small stuff" section for line-level notes.

```markdown
## Headline
<one sentence — the most important thing to fix>

## Premise — N/5
<the issue>
<concrete fix>

## Structure — N/5
...

## Argument — N/5
...

## Voice — N/5
...

## Small stuff
- ...
- ...
```

### 5. Be specific

Avoid: "tighten the argument", "make it punchier", "consider restructuring".
Prefer: "paragraph 3 claims X but never cites Y — drop or support", "section 4 belongs before section 2".

Quote the original text when calling out a specific phrase.

### 6. Offer to revise

End with: "Want me to apply these and produce a revised draft?" If yes, the next call is to `write` with the original + your review as input.

## Notes

- **Be honest.** A 5/5 means there's nothing material to fix. Don't grade-inflate to be polite.
- **Don't rewrite while reviewing.** That's a separate call. Reviews stay critical.
- **Voice tells matter.** If the doc has em-dash overuse, "delve", "in the rapidly evolving landscape of", call it out by quoting the offending phrase.
