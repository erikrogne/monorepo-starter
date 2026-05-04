# projects/AGENTS.md

Active, time-bound work. PARA's "Projects" tier.

## Layout

One subdirectory per project, kebab-case:

```
projects/
├── q4-launch/
│   ├── README.md       ← project overview, goals, status
│   ├── decisions.md    ← key calls made
│   └── notes.md        ← scratch
└── hiring-pm-2/
    └── README.md
```

Each project should have at least a `README.md` with: goal, success criteria, current status, key links.

## When to create one

A project belongs here if it has a clear end state and an active timeline. Ongoing responsibilities (e.g. "team management", "personal finance") belong in a separate `areas/` directory if you choose to add one — not here.

## When to archive

When a project is done or abandoned, move the directory under `projects/_archive/<year>/` (create as needed). Don't delete — archived projects are valuable training data for the `compile` skill.

## Cross-references

- Decisions made inside a project should also be cross-posted as a wiki entry in `wiki/decisions/` so they're searchable across projects.
- People mentioned should be cross-linked to `wiki/people/<name>.md` if a profile exists.
