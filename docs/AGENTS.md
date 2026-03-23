# Docs — Documentation and Examples

This folder contains documentation and example outputs for reference.

---

## Structure

```
docs/
├── AGENTS.md          ← You are here
└── examples/          ← Example outputs
    ├── example-prd.md
    └── example-status-update.md
```

---

## For Agents

### When to use docs/

- User asks to see example documents
- User wants to save a completed document for reference
- User needs inspiration for formatting

### Examples

Reference examples when users need inspiration:

| Example | Purpose |
|---------|---------|
| `examples/example-prd.md` | Shows a completed PRD format |
| `examples/example-status-update.md` | Shows a stakeholder update format |

### Related Locations

| Need | Look Here |
|------|-----------|
| PRD/spec templates | `.agents/prompts/` |
| MCP setup guide | `.agents/mcp/mcp-setup.md` |
| Meeting notes | `meetings/` |

---

## For Users

### Adding Your Own

- Save completed documents here for future reference
- Create subfolders for different project types (e.g., `docs/prds/`, `docs/specs/`)
- Keep examples of good outputs to help the agent learn your style

### Suggested Organization

```
docs/
├── examples/          ← Reference examples
├── prds/              ← Your PRDs
├── specs/             ← Design specs
└── research/          ← Research reports
```
