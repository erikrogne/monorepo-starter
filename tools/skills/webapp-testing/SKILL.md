---
name: webapp-testing
description: Toolkit for interacting with and testing local web applications using Playwright. Supports verifying frontend functionality, debugging UI behavior, and capturing screenshots.
---

# Web Application Testing

Test local web applications using Python Playwright scripts.

## Quick Start

```python
from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch(headless=True)
    page = browser.new_page()
    page.goto('http://localhost:3000')
    page.wait_for_load_state('networkidle')
    # Your test logic here
    browser.close()
```

## Reconnaissance Pattern

1. **Navigate and wait**: Always wait for `networkidle`
2. **Inspect**: Take screenshots or check DOM
3. **Identify selectors**: From rendered state
4. **Execute actions**: With discovered selectors

## Best Practices

- Use `sync_playwright()` for synchronous scripts
- Always close the browser when done
- Use descriptive selectors: `text=`, `role=`, CSS, IDs
- Add appropriate waits: `page.wait_for_selector()`
