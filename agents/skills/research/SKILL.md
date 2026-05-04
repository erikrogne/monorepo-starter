---
name: research
description: Multi-source research aggregator. Pulls from web + connected MCPs and synthesizes a report. Use when the user says "research X", "what's the state of Y", "look into Z", or any open-ended fact-finding request.
---

# research

Cross-source research. Pulls from the web and any connected MCPs (GitHub, Notion, Slack, Drive, Linear, Atlassian, etc.), synthesizes findings, and writes a report.

## When to use

- "Research X."
- "What's the state of Y?"
- "Look into Z and give me a summary."
- "Compare A and B."
- "Find prior art on …"

## Steps

### 1. Clarify scope

Quick gut-check before launching tools:
- Topic — what specifically?
- Audience — who reads the output? (informs depth + tone)
- Time horizon — last week / last year / all-time?
- Format — prose summary, comparison table, bullets, deck outline?

If any of these is genuinely ambiguous, ask. Don't ask all four.

### 2. Pick sources

Match the topic to source types:

| Topic kind | Likely sources |
|-----------|----------------|
| Public landscape (a market, a tool, a paper) | Web search |
| Internal prior work | `wiki/`, connected Notion/Drive/Confluence MCP |
| Engineering precedent | Connected GitHub MCP, Linear |
| Customer / sales context | Connected Slack, Atlassian, CRM |
| Past decisions | `wiki/decisions/` |

Run sources in parallel when possible.

### 3. Collect

For each source:
- Capture the URL or path of every citation.
- Note publish date or last-modified — recent sources outrank stale ones.
- Quote exact phrasing for any claim that's load-bearing in your synthesis.

### 4. Synthesize

Write a report. Structure depends on the question:

- **"What is X?"** → background → key facts → uncertainties.
- **"Compare A vs B"** → axes of comparison → table → recommendation.
- **"State of …"** → what's settled → what's contested → what's emerging.
- **"Should we do X?"** → context → options → trade-offs → recommended next step.

Cite inline. Every non-obvious claim should have a source.

### 5. Save (optional)

If the research is substantial, write to `wiki/concepts/<slug>.md` or `wiki/summaries/YYYY-MM-DD-<topic>.md` so it's findable later. Ask the user before saving — sometimes research is throwaway.

### 6. Suggest next steps

End with one line: "Want me to write this up as a one-pager?" or "Should I push on the comparison axis?" Pick the natural follow-on.

## Notes

- **Recency:** prefer sources from the last 12 months unless the topic is foundational. Quote dates.
- **Triangulate:** if only one source claims something material, flag it as "single-sourced".
- **Don't pad.** A 3-paragraph synthesis is fine if that's all the question warrants.
- **Be honest about gaps.** "I couldn't find a credible answer to X" is more useful than confident invention.
