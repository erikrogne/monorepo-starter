# Onboarding — Set Up Your AI Workspace

This guided onboarding helps you configure your monorepo for AI agents. It takes about **5-10 minutes** and will:

- Check and install prerequisites (Git, Node.js, QMD)
- Learn about you, your role, and your tools
- Capture your communication style and voice
- Identify workflows to automate
- Search [skills.sh](https://skills.sh) for additional skills matching your needs
- Set up automatic indexing and self-improvement
- Generate your personalized configuration files

---

## How to Start

Tell your AI agent:

> **"Run onboarding"** or **"Help me set up this monorepo"**

The agent will read this file and guide you through the process.

---

## Agent Instructions

When a user asks to run onboarding, follow this structured process. Ask questions one section at a time. Keep the conversation natural.

### Before Starting

Say:

> "Welcome! I'll help you set up your AI workspace. This takes about 5-10 minutes. I'll check your setup, ask some questions, then generate your configuration files and recommend skills for your workflow. Ready?"

---

## Section 0: Prerequisites (~2 min)

Check and help install required tools:

### Check Git
```bash
git --version
```
If not installed:
- **Mac:** `xcode-select --install`
- **Windows:** Download from [git-scm.com](https://git-scm.com/)

### Check Node.js
```bash
node --version
```
If not installed:
- **Mac:** `brew install node` or download from [nodejs.org](https://nodejs.org/)
- **Windows:** Download from [nodejs.org](https://nodejs.org/)

### Install QMD (markdown search)
```bash
npm install -g qmd
```

### Initial Index
```bash
qmd update
```

Tell the user:
> "I've checked your prerequisites. [Git ✓/✗] [Node ✓/✗] [QMD ✓/✗]. Let me help you install anything missing."

---


## Section 0.5: Knowledge Discovery (~2 min)

Before asking detailed questions, check if the user has existing knowledge sources the agent can learn from. This dramatically improves personalization.

Ask:

> "Before I ask you a bunch of questions, do you have any existing sources I can learn from to understand your context better? For example:"
>
> - **LinkedIn profile URL** — I can learn your background, role, and experience
> - **Company wiki or Notion/Confluence** — If you have a Glean API key or similar, I can search your company knowledge base
> - **Personal website or blog** — Writing samples and interests
> - **Existing bio or about page** — Quick context on who you are
> - **Previous AGENTS.md or custom instructions** — From another project
>
> "Just paste links or share API keys, and I'll extract what I can. Or say 'skip' to continue with questions."

### If the user provides sources:

1. **LinkedIn URL** — Fetch and extract: name, title, company, experience, skills, education. Pre-fill Section 1 answers.
2. **Glean API key** — Store in `.agents/mcp/` config. Search for: org chart, team info, recent projects, company terminology. Use findings to pre-fill sections and suggest relevant MCPs.
3. **Company wiki URL** — Fetch key pages about the user's team, products, glossary. Save relevant context to `identity/`.
4. **Personal site/blog** — Extract writing style, topics of interest, communication tone. Pre-fill Section 2 answers.
5. **Existing AGENTS.md** — Import preferences, learned patterns, and corrections.

### After processing sources:

> "Here's what I learned from your [source]:
> - [Key findings]
>
> I'll use this to pre-fill some answers. You can correct anything as we go."

**Then continue to Section 1**, but skip or pre-fill questions already answered by the knowledge sources.

---

## Section 1: Role & Context (~2 min)

Ask conversationally:

1. **What's your name and role?** (e.g., "Sarah, Senior PM")
2. **What company/team?** (e.g., "Stripe, Platform")
3. **Timezone?** (e.g., "PST")
4. **What are you working on right now?** (1-3 projects)
5. **What tools do you use daily?**
   - Docs: Notion, Confluence, Google Docs?
   - Design: Figma, Sketch?
   - PM: Jira, Linear, Asana?
   - Comms: Slack, Gmail, Teams?
   - Calendar: Google Calendar, Outlook?

**Store:** name, role, company, team, timezone, projects[], tools[]

---

## Section 2: Communication Style (~2 min)

1. **How would you describe your communication style?** (Direct? Detailed? Casual? Formal?)
2. **Do you prefer bullet points or prose? Summaries or detail?**
3. **Any words or phrases you tend to use?**
4. **Any words you avoid or dislike?**
5. **(Optional) Want to share a writing sample?**
   - Paste text, point to a file, or skip

**Store:** style, format_prefs, voice_sample, words_to_use[], words_to_avoid[]

---

## Section 3: Workflows & Pain Points (~2 min)

1. **What do you produce most often?** (PRDs, specs, emails, presentations, updates?)
2. **What tasks take too long?** (e.g., "Writing status updates", "Formatting PRDs")
3. **Any workflows you want to automate?** (e.g., "Meeting notes to action items")
4. **Who do you communicate with most?** (Engineers, designers, execs, customers?)

**Store:** outputs[], pain_points[], automation_wishes[], audiences[]

---

## Section 4: Preferences (~1 min)

1. **Pet peeves with AI assistants?** (e.g., "Too verbose", "Over-apologizes")
2. **Anything else the AI should know?**

**Store:** pet_peeves[], notes

---

## Section 5: Tools Setup (~1 min)

### Recommend Obsidian

> "I recommend using **[Obsidian](https://obsidian.md/)** to edit your markdown files. It's a free, powerful markdown editor. After installing, open this repo as a 'vault' (File → Open Vault → select this folder). This gives you a nice UI for your knowledge base."

### Set up QMD auto-indexing

Explain:
> "QMD indexes your markdown files for fast search. Run `qmd update` periodically, or I can help you set up automatic indexing."

For Mac, offer to create a cron job or launchd plist for daily indexing.

---

## Section 6: Search for Additional Skills

Use the skills CLI to find relevant skills based on user's workflows:

```bash
npx skills find [workflow_keywords]
```

**Search based on their answers:**
- If they mentioned "presentations" → `npx skills find presentations slides`
- If they mentioned "research" → `npx skills find user research synthesis`
- If they mentioned "design" → `npx skills find figma design ui`
- If they mentioned "writing" → `npx skills find writing documentation`
- If they mentioned "meetings" → `npx skills find meeting notes transcription`

Present found skills:
> "Based on your workflows, I found these additional skills on skills.sh:
> - [skill-name] - [description]
> - [skill-name] - [description]
>
> Want me to install any of these?"

To install:
```bash
npx skills add owner/repo@skill-name -g -y
```

---

## Section 7: Review & Generate

### Summarize

> **Here's what I learned:**
> - **Role:** [role] at [company]
> - **Focus:** [projects]
> - **Tools:** [tools]
> - **Style:** [style]
> - **Main outputs:** [outputs]
> - **Pain points:** [pain_points]
>
> **Does this look right?**

### Recommend Built-in Skills & MCPs

**Tool to MCP:**
- Figma → figma MCP
- Linear → linear MCP
- Jira → jira MCP
- Gmail → gmail MCP
- Google Calendar → google-calendar MCP
- Notion → notion MCP
- Slack → slack MCP

**Workflow to Skill:**
- PRDs, specs → doc-coauthoring
- UI prototypes → frontend-design, ui-ux-pro-max
- Marketing copy → copywriting
- Status updates → internal-comms
- User research → user-research
- Presentations → pptx
- PDFs → pdf
- Brainstorming → brainstorming
- Polish AI text → humanizer

Present recommendations and offer to configure.

---

## Generate Files

After confirmation:

### 1. Update identity/about-you.md
Replace template with actual values.

### 2. Create identity/voice-guide.md
Include style, format prefs, words to use/avoid, writing sample.

### 3. Save onboarding transcript
Save Q&A with date and config summary to `raw/notes/`.

### 4. Update .agents/mcp/mcp-servers.json
Add recommended MCPs with placeholder tokens.

### 5. Update root AGENTS.md
Add "User Preferences" section near top with their context.

### 6. Run initial QMD index
```bash
qmd update
```

---

## Completion

> **You're all set!**
>
> **Created:**
> - `identity/about-you.md` - your context
> - `identity/voice-guide.md` - your writing style
> - Onboarding transcript saved to `raw/notes/`
>
> **Installed:**
> - QMD for fast search (`qmd update` to refresh index)
> - [Any skills from skills.sh]
>
> **Recommended:**
> - Install [Obsidian](https://obsidian.md/) and open this folder as a vault
> - Run `qmd update` weekly to keep search current
>
> **Self-improvement is enabled.** After each session, I'll update AGENTS.md with learned preferences.
>
> What would you like to work on first?

---

## Re-running

If onboarding was completed before:

> "You've completed onboarding before. Want to:
> 1. **Update everything** - full onboarding
> 2. **Update one section** - prerequisites, role, voice, workflows, or tools
> 3. **Search for new skills** - check skills.sh for new additions
> 4. **Cancel** - keep current"
