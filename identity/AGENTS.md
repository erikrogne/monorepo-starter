# identity/AGENTS.md

Who the user is, how they work, how they want to be communicated with.

## Files

- `about-you.md` — bio, role, current focus, working style, tools.
- `voice-guide.md` — how the user writes and wants the agent to write back.

Both are populated by the `onboard` skill on first run. Either file may be edited by hand at any time.

## Read-first rule

**Every agent session must read both files before doing substantive work.** If either is missing or empty, prompt the user to run `onboard` rather than guessing.

## Privacy

Both files are personal. They are listed in `.gitignore` so they won't be committed by default — keep it that way unless the user explicitly opts in.
