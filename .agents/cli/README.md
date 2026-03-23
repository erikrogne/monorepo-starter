# CLI Tools

Command-line utilities for working with your monorepo.

## QMD (Quick Markdown Search)

Token-efficient search for markdown files. Reduces context usage by ~90%.

### Installation

```bash
# Install via npm
npm install -g qmd

# Or use npx
npx qmd --help
```

### Usage

```bash
# Always update index first
qmd update

# Search methods (pick one)
qmd search "keywords" -n 5       # Fast keyword search
qmd vsearch "concept"            # Semantic/vector search  
qmd query "question" -n 10       # Best quality (hybrid + rerank)

# Get full document by path
qmd get "meetings/2024-02-15_sync.md"
```

### When to Use

| Instead of... | Use... |
|---------------|--------|
| `grep -r "term" .` | `qmd search "term"` |
| Reading multiple files | `qmd query "question"` |
| Finding related content | `qmd vsearch "concept"` |

### More Info

- [QMD Documentation](https://github.com/anthropics/qmd)
