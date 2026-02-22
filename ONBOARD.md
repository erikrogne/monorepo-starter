# Onboarding — Set Up Your AI Workspace

This guided onboarding helps you configure your monorepo for AI agents. It takes about **5-10 minutes** and will:

- Learn about you, your role, and your tools
- Capture your communication style and voice
- Identify workflows to automate
- Recommend relevant skills and MCP integrations
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

> "Welcome! I'll help you set up your AI workspace. This takes about 5-10 minutes. I'll ask you some questions, then generate your configuration files and recommend skills for your workflow. Ready?"

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

## Section 5: Review & Generate

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

### Recommend Skills & MCPs

**Tool to MCP:**
- Figma -> figma MCP
- Linear -> linear MCP
- Jira -> jira MCP
- Gmail -> gmail MCP
- Google Calendar -> google-calendar MCP
- Notion -> notion MCP
- Slack -> slack MCP

**Workflow to Skill:**
- PRDs, specs -> doc-coauthoring
- UI prototypes -> frontend-design, ui-ux-pro-max
- Marketing copy -> copywriting
- Status updates -> internal-comms
- User research -> user-research
- Presentations -> pptx
- PDFs -> pdf
- Brainstorming -> brainstorming
- Polish AI text -> humanizer

Present recommendations and offer to configure.

---

## Generate Files

After confirmation:

### 1. Update knowledge/about-you.md
Replace template with actual values.

### 2. Create knowledge/voice-guide.md
Include style, format prefs, words to use/avoid, writing sample.

### 3. Create docs/onboarding-transcript.md
Save Q&A with date and config summary.

### 4. Update tools/mcp/mcp-servers.json
Add recommended MCPs with placeholder tokens.

### 5. Update root AGENTS.md
Add "User Preferences" section near top.

---

## Completion

> **You're all set!**
>
> Created:
> - knowledge/about-you.md - your context
> - knowledge/voice-guide.md - your writing style
> - docs/onboarding-transcript.md - this conversation
>
> Skills are in tools/skills/. Set up MCPs in tools/mcp/.
>
> To re-run, say "run onboarding" again.
>
> What would you like to work on first?

---

## Re-running

If onboarding exists:

> "You've completed onboarding before. Want to:
> 1. **Update everything** - full onboarding
> 2. **Update one section** - role, voice, or workflows
> 3. **Cancel** - keep current"
