# agents/crons/AGENTS.md

Background jobs that keep this repo's memory and search index fresh.

## Available crons

| Cron | What it does | Default schedule |
|------|--------------|------------------|
| `session-sync` | Pulls AI agent transcripts from local caches into `memory/session-logs/`. | hourly |
| `qmd-update` | Refreshes a markdown search index (e.g. `qmd`). Only useful if you've installed such a tool. | nightly @ 05:30 |

## Install

```bash
agents/crons/install.sh session-sync     # one
agents/crons/install.sh qmd-update       # one
agents/crons/install.sh all              # both
```

The installer registers the job with launchd (macOS) or systemd-user / cron (Linux), depending on what's available.

To uninstall:

```bash
agents/crons/install.sh --uninstall session-sync
```

## Adding a cron

1. Create `agents/crons/<name>/script.sh`. Make it idempotent.
2. Add a launchd plist template at `agents/crons/<name>/com.monorepo-starter.<name>.plist` (macOS) or a systemd unit at `agents/crons/<name>/<name>.service` + `.timer` (Linux).
3. Register the cron in `agents/crons/registry.json` so `install.sh` knows about it.
4. Document it here.

## Conventions

- Crons must be safe to run repeatedly. Do not assume "first run".
- Crons must not block on user input.
- Crons should log to `memory/crons/<name>.log` (rotate when it gets large).
- Crons must not write to `raw/` (immutability rule still applies — if you need an importer, write a sync script that lives elsewhere and is invoked by a cron).
