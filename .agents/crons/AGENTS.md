# Crons — Scheduled Automations

> Automated tasks that run on a schedule using launchd (macOS) or cron.

---

## Structure

```
crons/
├── AGENTS.md        ← You are here
├── registry.json    ← Central registry of all crons
└── [your-cron]/     ← Individual cron folders
    ├── script.sh    ← The script to run
    └── *.plist      ← launchd configuration
```

---

## Registry

All crons are registered in `registry.json`. This enables:
- Centralized discovery of all automations
- Status tracking (enabled/disabled)
- Scheduling information

---

## Adding a New Cron

1. Create a folder for your cron: `crons/my-task/`
2. Add your script: `my-task/script.sh`
3. Create a plist file: `my-task/com.yourname.my-task.plist`
4. Register in `registry.json`
5. Load with: `launchctl load ~/Library/LaunchAgents/com.yourname.my-task.plist`

---

## Example Crons

| Name | Schedule | Purpose |
|------|----------|---------|
| `qmd-update` | Every 30 min | Update markdown search index |
| `auto-commit` | Every hour | Commit and push changes |
| `daily-briefing` | 7am | Generate morning summary |

---

## For Agents

- Check `registry.json` for available automations
- Help users create new crons when they describe recurring tasks
- Suggest automation opportunities based on user workflows
